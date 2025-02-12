-- local sample_launcher_spec = {
--   type = 'python',
--   program = {'python'}  -- optional
--   program_debug = {'python', '-m', 'debugpy.adapter'}  -- optional
--   extra_args = {'-xyz'},
--   environment = {},
-- }

local base64 = require('utils.base64')

local M = {}

M.launcher_specs = {}
M.launcher_runners = {
  python = {
    runner = {"python"},
    module_runner = {"python", "-m"},
  }
}

M.add_launcher_spec = function(spec)
  table.insert(M.launcher_specs, spec)
end

M.show_launcher = function(launch_opts)
  local pickers = require('telescope.pickers')
  local finders = require('telescope.finders')
  local conf = require('telescope.config').values
  local actions = require('telescope.actions')
  local action_state = require('telescope.actions.state')

  launch_opts = launch_opts or {mode = "run"}

  local opts = {
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(
        function()
          local dap = require('dap')
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          local launch_spec = selection.value
          vim.print("Selection:")
          vim.print(selection)
          -- local spawn_args = {"term-launcher", selection[1]}
          -- vim.system(spawn_args)

          -- vim.uv.spawn("wezterm", {args={"start", "--", "htop"}})
          -- vim.uv.spawn("term-launcher", {args={"bash"}, cwd=vim.fn.getcwd()})

          if launch_opts.mode == "run" then
            local runner = M.launcher_runners[launch_spec.type]
            local run_args = {}
            if launch_spec.is_module then
              vim.list_extend(run_args, runner.module_runner)
            else
              vim.list_extend(run_args, runner.runner)
            end
            vim.list_extend(run_args, {launch_spec.target})

            local env_formatted = {}
            -- Copy environment, prefer vars set by client
            for k, v in pairs(vim.tbl_extend('keep', launch_spec.environment or {}, vim.fn.environ())) do
              if k:find "^[^=]*$" then -- correct variable?
                env_formatted[#env_formatted+1] = k.."="..tostring(v)
              end
            end

            vim.uv.spawn("term-launcher", {
              args = run_args,
              cwd = vim.fn.getcwd(),
              env = env_formatted,
            })
          elseif launch_opts.mode == "debug" then
            local dap_run_args = {
              name = launch_spec.name,
              request = "launch",
              type = launch_spec.type,
              console = 'externalTerminal',
              env = launch_spec.environment,
            }
            if launch_spec.is_module then
              dap_run_args.module = launch_spec.target
            else
              dap_run_args.program = vim.fn.getcwd() .. '/' .. launch_spec.target
            end
            dap.run(dap_run_args)
          end
        end
      )
      return true
    end,
  }

  pickers.new(opts, {
    prompt_title = launch_opts.mode == "run" and "Run Launcher" or "Debug Launcher",
    finder = finders.new_table {
      results = M.launcher_specs,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.name or "Unknown",
          ordinal = entry.name or 1,
        }
      end
    },
  }):find()
end

return M
