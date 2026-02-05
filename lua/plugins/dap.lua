-- Integration with DAP (Debug Adapter Protocol) for debugging. Also some related plugins:
-- virtual text for showing debug information in the editor, telescope extension.
--
-- TAG:dap
-- TAG:debug
-- TAG:telescope

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- See colors defined in `plugins/visuals.lua`
      vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl= 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPointLine', numhl= 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStoppedLine', numhl= 'DapStopped' })

      dap.defaults.fallback.external_terminal = {
        command = 'term-launcher';
        args = {};
        -- args = {'cli', 'spawn', '--'};
      }

      dap.adapters.python = function(cb, config)
        if config.request == 'attach' then
          ---@diagnostic disable-next-line: undefined-field
          local port = (config.connect or config).port or 1901
          ---@diagnostic disable-next-line: undefined-field
          local host = (config.connect or config).host or '127.0.0.1'
          cb({
            type = 'server',
            port = port,
            host = host,
            options = {
              source_filetype = 'python',
            },
          })
        else
          cb({
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
            options = {
              source_filetype = 'python',
            },
          })
        end
      end

      dap.configurations.python = {
        {
          -- The first three options are required by nvim-dap
          type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
          request = 'launch';
          name = "Launch current file";
          console = "externalTerminal";

          -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

          program = "${file}"; -- This configuration will launch the current file if used.
          pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            -- local cwd = vim.fn.getcwd()
            -- if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            --   return cwd .. '/venv/bin/python'
            -- elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            --   return cwd .. '/.venv/bin/python'
            -- else
            --   return '/usr/bin/python'
            -- end
            return 'python'
          end
        },
      }

    end,
    keys = {
      {
        "<Leader>db", function() require("dap").toggle_breakpoint() end,
        desc = "DAP Toggle breakpoint",
      },
      {
        "<Leader>di", function() require("dap").step_into() end,
        desc = "DAP Step into",
      },
      {
        "<Leader>do", function() require("dap").step_out() end,
        desc = "DAP Step out",
      },
      {
        "<Leader>dd", function() require("dap").step_over() end,
        desc = "DAP Step over",
      },
      {
        "<Leader>dc", function() require("dap").continue() end,
        desc = "DAP Continue",
      },
      {
        "<Leader>dR", function() require("dap").repl.open() end,
        desc = "DAP Open REPL",
      },
      {
        "<Leader>dT", function() require("dap").terminate() end,
        desc = "DAP Terminate session",
      },
      {
        "<Leader>de", function() require("dap.ui.widgets").hover() end,
        desc = "DAP Eval expression under the cursor",
      },
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    config = true,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    enabled = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
}
