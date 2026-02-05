-- Configuration of the LSP servers. Also includes the `none-ls` plugin (adapter
-- for the CLI tools to make them behave like LSP servers).
--
-- TAG:lspconfig
-- TAG:none-ls
-- TAG:lsp
-- TAG:completion
-- TAG:diagnostics

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
      local lspconfig = vim.lsp.config

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
          underline = false
        }
      )

      --
      vim.lsp.enable('gopls')
      --
      vim.lsp.enable('ruff')
      -- lspconfig.ruff.setup({
      --   capabilities = cmp_capabilities,
      --   autostart = true,
      -- })
      --
      -- lspconfig.jedi_language_server.setup({
      --   capabilities = cmp_capabilities,
      --   autostart = true,
      --   cmd = { "jedi-language-server", "-v", "--log-file", "/tmp/jedi-language-server.log" },
      -- })
      --

      if vim.env.NVIM_LSP_JEDI ~= 'off' then
        vim.lsp.enable('jedi_language_server')
      end

      if vim.env.NVIM_LSP_ZUBAN ~= 'off' then
        vim.lsp.enable('zuban')
        vim.lsp.config['zuban'] = vim.tbl_deep_extend('force', vim.lsp.config['zuban'], {
            root_dir = vim.env.NVIM_PROJECT_ROOT or nil,
            cmd = {'uvx', 'zuban', 'server'},
        })
      end
      -- lspconfig.zuban.setup({
      --   capabilities = cmp_capabilities,
      --   autostart = true,
      -- })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'python',
        callback = function(args)
          vim.lsp.start({
            -- capabilities = cmp_capabilities,
            -- name = 'python_tags',
            -- cmd = {'python', '-m', 'tag_complete.language_server'},
            name = 'import_completer',
            -- cmd = {'python', '-m', 'import_completer', 'server', '-l', 'DEBUG', '-L', '/tmp/import_completer.log'},
            -- cmd = {'python', '-m', 'import_completer.language_server'},
            cmd = {'py-import-completer-server'},
            root_dir = vim.env.NVIM_PROJECT_ROOT or vim.fs.root(args.buf, {'setup.py', 'pyproject.toml'}),
            autostart = true,
            filetypes = {'python'},
            single_file_support = true,
          })
        end,
      })
      --
      vim.lsp.enable('clangd')
      -- lspconfig.clangd.setup({
      --   capabilities = cmp_capabilities,
      --   cmd = { "clangd", '--background-index' }
      -- })

      --
      -- local on_attach = function(client)
      --   require'completion'.on_attach(client)
      -- end

      vim.lsp.enable('rust_analyzer')
      -- lspconfig.rust_analyzer.setup({
      --   -- on_attach = on_attach,
      --   settings = {
      --     ["rust-analyzer"] = {
      --       imports = {
      --         granularity = {
      --           group = "module",
      --         },
      --         prefix = "self",
      --       },
      --       cargo = {
      --         buildScripts = {
      --           enable = true,
      --         },
      --       },
      --       procMacro = {
      --         enable = true
      --       },
      --     }
      --   }
      -- })

      -- lspconfig.zls.setup({
      --   cmd = { "/home/maniek/.local_zig/zls-master", "--log-file", "/tmp/zls.log", "--log-level", "debug" },
      -- })

      --

      vim.lsp.enable('lua_ls')
      -- require'lspconfig'.lua_ls.setup {
      --   on_init = function(client)
      --     if client.workspace_folders then
      --       local path = client.workspace_folders[1].name
      --       if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
      --         return
      --       end
      --     end
      --
      --     client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      --       runtime = {
      --         -- Tell the language server which version of Lua you're using
      --         -- (most likely LuaJIT in the case of Neovim)
      --         version = 'LuaJIT'
      --       },
      --       -- Make the server aware of Neovim runtime files
      --       workspace = {
      --         checkThirdParty = false,
      --         library = {
      --           vim.env.VIMRUNTIME
      --           -- Depending on the usage, you might want to add additional paths here.
      --           -- "${3rd}/luv/library"
      --           -- "${3rd}/busted/library",
      --         }
      --         -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
      --         -- library = vim.api.nvim_get_runtime_file("", true)
      --       }
      --     })
      --   end,
      --   settings = {
      --     Lua = {}
      --   }
      -- }
    end,

    keys = {
      {
        "<Backspace>w", function() vim.lsp.buf.set_loclist() end,
        desc="Set loclist",
      },
      {
        "<Backspace><Backspace>", function() vim.lsp.buf.hover() end,
        desc="LSP hover",
      },
      {
        "<Backspace>e", function() vim.diagnostic.open_float() end,
        desc="Show diagnostics under the cursor",
      },
      {
        "<Backspace>d", function() vim.lsp.buf.definition() end,
        desc="Go to definition",
      },
      {
        "<Backspace>R", function() vim.lsp.buf.rename() end,
        desc="Rename symbol",
      },
      {
        "<Backspace>=", function() vim.lsp.buf.format({ async = true }) end,
        desc="Reformat code",
      },
      {
        "<Backspace>a", function() vim.lsp.buf.code_action() end,
        desc="Perform code action",
      },
      {
        "<Backspace>K", function() vim.lsp.buf.signature_help() end,
        desc="Show signature help",
      },
      {
        "<Backspace>=", function()
          vim.lsp.buf.format({ async = true })
          vim.api.nvim_input("<Esc>")
        end,
        mode = "v",
        desc="Reformat (selected) code",
      },
    },
  },
  --
  -- {
  --   "nvimtools/none-ls.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = {
  --       nls.builtins.formatting.black,
  --       nls.builtins.formatting.isort,
  --       nls.builtins.diagnostics.mypy,
  --     }
  --     return opts
  --   end,
  -- },
}
