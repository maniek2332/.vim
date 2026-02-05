vim.o.exrc = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.magic = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.clipboard = 'unnamedplus'

vim.o.mousemoveevent = true

vim.o.laststatus = 3
vim.o.signcolumn = 'yes:1'

vim.o.undofile = true

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldenable = false

-- Enable thin cursor in the TERMINAL buffers
vim.o.guicursor = 'n-v-c-sm:block,i-ci-ve-t:ver25,r-cr-o:hor20'

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "lua",
    callback = function(args)
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "python",
    callback = function(args)
      vim.bo.indentkeys = ""
    end
  }
)

vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "markdown",
    callback = function(args)
      vim.bo.shiftwidth = 2
      vim.bo.tabstop = 2
    end
  }
)

vim.api.nvim_create_autocmd(
  {"WinEnter", "WinLeave"},
  {
    callback = function(args)
      vim.wo.cursorline = args.event == "WinEnter"
    end
  }
)

-- local timer = assert(vim.uv.new_timer()) --- @type uv.uv_timer_t
-- timer:start(1000, 250, vim.schedule_wrap(function()
--   if vim.api.nvim_get_mode()["mode"] ~= "n" then
--     return
--   end
--
--   local pos = vim.fn.getmousepos()
--
--   if vim.api.nvim_get_current_win() ~= pos.winid then
--     vim.api.nvim_set_current_win(pos.winid)
--   end
-- end))

require("config.lazy")
require("config.launchers")
require("config.mappings")

