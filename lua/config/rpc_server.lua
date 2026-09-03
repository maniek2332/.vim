-- Start a Neovim RPC server on a UNIX socket, whose path is taken from the
-- `NVIM_TMUX_SOCKET` environment variable (set by the parent shell, e.g. from
-- a fish function mirroring tmux session id -> path).
--
-- Behaviour:
--   * NVIM_TMUX_SOCKET unset/empty -> do nothing (no server started).
--   * Path exists and a server is alive there -> leave it alone.
--   * Path exists but is stale (no listener)   -> remove and recreate.
--   * Otherwise -> create the server with vim.fn.serverstart().
--
-- Path computation lives in the shell so the same value is available to both
-- Neovim (this module) and any client invoking it over the socket.

local M = {}

--- Probe whether something is actually listening on `path`.
--- Connects a libuv AF_UNIX pipe; nil err in the callback means a live server.
local function socket_alive(path)
  local pipe = assert(vim.uv.new_pipe(false))
  local done, ok = false, false
  pipe:connect(path, function(err)
    ok = (err == nil)
    done = true
    pipe:close()
  end)
  vim.wait(2000, function() return done end, 10)
  if not done then pipe:close() end -- timed out; treat as dead
  return ok
end

--- Start the RPC server if NVIM_TMUX_SOCKET is set. Returns the socket path
--- on success, nil otherwise. The resolved path is stored in M.socket_path.
M.start = function()
  local path = vim.env.NVIM_TMUX_SOCKET
  if path == nil or path == '' then return nil end

  if vim.uv.fs_stat(path) then
    if socket_alive(path) then
      M.socket_path = path -- live server already owns this socket
      return nil
    end
    vim.uv.fs_unlink(path) -- stale leftover, reclaim it
  end

  vim.fn.serverstart(path)
  M.socket_path = path
  return path
end

return M
