-- Integration with Claude Code
--
-- TAG:claudecode
-- TAG:llm
-- TAG:assistant
-- TAG:ui-window
-- TAG:terminal
-- URL:https://github.com/coder/claudecode.nvim

-- Custom tmux terminal provider
local tmux_provider = {}

tmux_provider.setup = function(opts)
  -- Store any provider-specific options for later use
  tmux_provider._config = opts or {}

  return true
end

tmux_provider.is_available = function()
  -- Check if tmux is installed
  local has_tmux = vim.fn.executable("tmux") == 1
  if not has_tmux then
    return false
  end

  -- Check if we're currently in a tmux session
  local in_tmux = vim.fn.system("tmux info 2>/dev/null && echo 1 || echo 0"):match("1")
  return in_tmux ~= nil
end

tmux_provider.open = function(cmd_string, env_table, effective_config)
  return tmux_provider._call_togglable_pane(cmd_string, env_table, effective_config)
end

tmux_provider.close = function()
  vim.fn.system("/usr/bin/python3 /home/maniek/.config/tmux/scripts/togglable_pane.py claude --close")
end

-- tmux_provider.is_open = function(handle)
--   if not handle then
--     return false
--   end
--
--   -- Check if pane exists in any window
--   local result = vim.fn.system(string.format(
--     "tmux list-panes -a -F '#{pane_id}' | grep -q '^%s$' && echo 1 || echo 0",
--     handle
--   ))
--
--   return result:match("1") ~= nil
-- end

-- tmux_provider.focus = function(handle)
--   if handle then
--     vim.fn.system(string.format("tmux select-pane -t %s", handle))
--   end
-- end

tmux_provider.simple_toggle = function(cmd_string, env_table, effective_config)
  return tmux_provider._call_togglable_pane(cmd_string, env_table, effective_config)
end

tmux_provider.focus_toggle = function(handle)
  vim.fn.system("/usr/bin/python3 /home/maniek/.config/tmux/scripts/togglable_pane.py claude --focus")
end

tmux_provider.toggle = function(handle)
  vim.fn.system("/usr/bin/python3 /home/maniek/.config/tmux/scripts/togglable_pane.py claude --focus")
end

tmux_provider.get_active_bufnr = function(handle)
  return nil
end

tmux_provider._call_togglable_pane = function(cmd_string, env_table, effective_config)
  -- Build environment variable string
  local env_str = ""
  if env_table then
    if env_table.FORCE_CODE_TERMINAL then
      env_table.FORCE_CODE_TERMINAL = nil
    end
    for k, v in pairs(env_table) do
      local value_str
      if type(v) == "table" then
        -- Convert table to string (join array elements with spaces)
        value_str = table.concat(v, " ")
      else
        value_str = tostring(v)
      end
      env_str = env_str .. string.format("%s=%s ", k, vim.fn.shellescape(value_str))
    end
  end

  -- vim.fn.system(string.format("/usr/bin/python3 /home/maniek/.config/tmux/scripts/togglable_pane.py claude --create '%s %s'", env_str, cmd))
  vim.fn.system(string.format("/usr/bin/python3 /home/maniek/.config/tmux/scripts/togglable_pane.py claude --focus --ensure '%s %s'", env_str, cmd_string))
end

return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
    opts = {
      terminal = {
        provider = tmux_provider,
        -- provider = 'native',
        -- provider = 'none',
      },
    },
  }
}
