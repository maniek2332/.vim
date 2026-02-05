-- TAB completions for code, cmd, etc. Completion is provided by LSP, buffer, path, and tags.
--
-- TAG:blink
-- TAG:completion

---@return boolean
function is_prev_char_whitespace()
  local pos = vim.api.nvim_win_get_cursor(0)
  local row, col = pos[1], pos[2]  -- col is 0-based in Neovim
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""

  -- If cursor is at column 0, treat as whitespace
  if col == 0 then
    return true
  end

  -- Get the character immediately before the cursor
  local ok, prev_char = pcall(function()
    return vim.fn.strcharpart(line, vim.fn.byteidx(line, col - 1), 1)
  end)

  if not ok or prev_char == "" then
    return true
  end

  -- Return true if it’s a whitespace character (space, tab, etc.)
  return prev_char:match("%s") ~= nil
end

function tab_on_whitespace(_)
  if is_prev_char_whitespace() then
    local tabkey = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
    vim.api.nvim_feedkeys(tabkey, 'n', false)
    return true
  end
  return false
end

return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "default",
      ["<Tab>"] = { tab_on_whitespace, "select_next", "show", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<CR>"] = { "snippet_forward", "accept", "fallback" },
      ["<A-CR>"] = { "snippet_backward" },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkDocWindow,FloatBorder:BlinkDocBorder",
        },
      },
      menu = {
        auto_show = false,
        border = "rounded",
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        max_height = 25,
        -- max_width = 80,
        draw = {
          columns = {
            { 'label', 'label_description', gap = 1 },
            { 'source_name', 'client_name', gap = 1 },
            { 'kind' },
          },
          components = {
            label = {
              text = function(item)
                -- vim.print(item)
                local text = item.label
                if item.item.additionalTextEdits then
                  text = text .. "~"
                end
                return text
              end,
              highlight = "CmpItemAbbr",
            },
            client_name = {
              text = function(item)
                return item.item.client_name
              end,
            },
          },
        },
      },
      list = {
        selection = { preselect = false },
      },
      accept = {
        auto_brackets = {
          kind_resolution = {
            enabled = false,  -- don't insert brackets for function kind
          },
        },
      },
    },

    cmdline = {
      keymap = {
        ["<CR>"] = { "accept", "fallback" },
      },
      completion = {
        menu = { auto_show = false },
        ghost_text = { enabled = false },
        list = { selection = { preselect = false, auto_insert = false } },
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
