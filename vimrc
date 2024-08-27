" vim: sw=2
set nocompatible
set exrc

" *** VIMRC controls
let g:vimrc_undofile = 1
let g:vimrc_mouse = 1
let g:vimrc_colorscheme_wombat = 0
let g:vimrc_colorscheme_wombat_mods = 0
let g:vimrc_console_title = 1
let g:vimrc_auto_readwrite = 0
let g:vimrc_load_plugins = $VIMRC_LOAD_PLUGINS != "0" && tolower($VIMRC_LOAD_PLUGINS) != "false" && tolower($VIMRC_LOAD_PLUGINS) != "no"
let g:vimrc_load_nvim_plugins = g:vimrc_load_plugins && has("nvim") && 1

let g:vimrc_lsp = g:vimrc_load_plugins && 0
let g:vimrc_lsp_completion = g:vimrc_lsp && 0
let g:vimrc_fzf = g:vimrc_load_plugins && 0
let g:vimrc_python_indent = g:vimrc_load_plugins && 0
let g:vimrc_cython_syntax = g:vimrc_load_plugins && 0
let g:vimrc_cmake_syntax = g:vimrc_load_plugins && 0
let g:vimrc_rainbow = g:vimrc_load_plugins && 0
let g:vimrc_alternates = g:vimrc_load_plugins && 0
let g:vimrc_git_utils = g:vimrc_load_plugins && 1
let g:vimrc_test_runner = g:vimrc_load_plugins && 1
let g:vimrc_commenter = g:vimrc_load_plugins && 1
let g:vimrc_ctrlsf = g:vimrc_load_plugins && 0
let g:vimrc_vista = g:vimrc_load_plugins && 0
let g:vimrc_python_fold = g:vimrc_load_plugins && 0
let g:vimrc_custom_foldtext = g:vimrc_load_plugins && 0
let g:vimrc_fast_fold = g:vimrc_load_plugins && 0
let g:vimrc_sneak = g:vimrc_load_plugins && 0
let g:vimrc_surround = g:vimrc_load_plugins && 0
let g:vimrc_repeat = g:vimrc_load_plugins && 0
let g:vimrc_notational_fzf = g:vimrc_load_plugins && 0
let g:vimrc_lightline = g:vimrc_load_plugins && 0
let g:vimrc_lualine = g:vimrc_load_plugins && 1
let g:vimrc_gutentags = g:vimrc_load_plugins && 1
let g:vimrc_colorscheme_gruvbox = g:vimrc_load_plugins && 0
let g:vimrc_colorscheme_monokai = g:vimrc_load_plugins && 1

let g:vimrc_nio = g:vimrc_load_plugins && 1
let g:vimrc_mason = g:vimrc_load_plugins && 0
let g:vimrc_cmp = g:vimrc_load_nvim_plugins && 1
let g:vimrc_luasnip = g:vimrc_load_nvim_plugins && 1
let g:vimrc_nvim_lspconfig = g:vimrc_load_nvim_plugins && 1
let g:vimrc_vsnip = g:vimrc_load_nvim_plugins && 0
let g:vimrc_which_key = g:vimrc_load_nvim_plugins && 0
let g:vimrc_telescope = g:vimrc_load_nvim_plugins && 1
let g:vimrc_polyglot = g:vimrc_load_nvim_plugins && 0
let g:vimrc_chadtree = g:vimrc_load_nvim_plugins && 0
let g:vimrc_trouble = g:vimrc_load_nvim_plugins && 1
let g:vimrc_treesitter = g:vimrc_load_nvim_plugins && 1
let g:vimrc_treesitter_context = g:vimrc_load_nvim_plugins && 1
let g:vimrc_treesitter_textobjects = g:vimrc_load_nvim_plugins && 1
let g:vimrc_dap = g:vimrc_load_nvim_plugins && 1
let g:vimrc_diffconflicts = g:vimrc_load_nvim_plugins && 1
let g:vimrc_toggleterm = g:vimrc_load_nvim_plugins && 1
let g:vimrc_overseer = g:vimrc_load_nvim_plugins && 0
let g:vimrc_toggletasks = g:vimrc_load_nvim_plugins && 0
let g:vimrc_asynctasks = g:vimrc_load_nvim_plugins && 1
let g:vimrc_autosave = g:vimrc_load_nvim_plugins && 1
let g:vimrc_rope = g:vimrc_load_nvim_plugins && 1
let g:vimrc_ai = g:vimrc_load_nvim_plugins && 1
let g:vimrc_neotest = g:vimrc_load_nvim_plugins && 1
let g:vimrc_copilot_lua = g:vimrc_load_nvim_plugins && 1
let g:vimrc_copilot_vanilla = g:vimrc_load_nvim_plugins && 0
let g:vimrc_surround = g:vimrc_load_plugins && 1
let g:vimrc_lint = g:vimrc_load_plugins && 1
let g:vimrc_yanky = g:vimrc_load_plugins && 1
let g:vimrc_nui = g:vimrc_load_plugins && 1
let g:vimrc_neotree = g:vimrc_load_plugins && 1
let g:vimrc_markview = g:vimrc_load_plugins && 1

if g:vimrc_fzf && !isdirectory($HOME . "/.fzf")
  echo "WARN: vimrc_fzf enabled but ~/.fzf is not found"
  let g:vimrc_fzf = 0
endif


if g:vimrc_load_plugins
  call plug#begin('~/.vim/plugged')
  Plug 'LucHermitte/lh-vim-lib'
  if g:vimrc_colorscheme_gruvbox
    Plug 'morhetz/gruvbox'
  endif " g:vimrc_colorscheme_gruvbox
  if g:vimrc_colorscheme_monokai
    Plug 'loctvl842/monokai-pro.nvim'
  endif " g:vimrc_colorscheme_monokai
  if g:vimrc_lsp
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
  endif
  if g:vimrc_lsp_completion
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
  endif
  if g:vimrc_fzf
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim'
  endif
  if g:vimrc_python_indent
    Plug 'Vimjas/vim-python-pep8-indent'
  endif
  if g:vimrc_cython_syntax
    Plug 'lambdalisue/vim-cython-syntax'
  endif
  if g:vimrc_cmake_syntax
    Plug 'pboettch/vim-cmake-syntax'
  endif
  if g:vimrc_rainbow
    Plug 'luochen1990/rainbow'
  endif
  if g:vimrc_alternates
    Plug 'LucHermitte/alternate-lite'
  endif
  if g:vimrc_git_utils
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'airblade/vim-gitgutter'
  endif
  if g:vimrc_test_runner
    Plug 'janko-m/vim-test'
  endif
  if g:vimrc_commenter
    Plug 'tomtom/tcomment_vim'
  endif
  if g:vimrc_ctrlsf
    Plug 'dyng/ctrlsf.vim'
  endif
  if g:vimrc_vista
    Plug 'liuchengxu/vista.vim'
  endif
  if g:vimrc_python_fold
    Plug 'tmhedberg/SimpylFold'
  endif
  if g:vimrc_fast_fold
    Plug 'Konfekt/FastFold'
  endif
  if g:vimrc_sneak
    Plug 'justinmk/vim-sneak'
  endif
  if g:vimrc_surround
    Plug 'tpope/vim-surround'
  endif
  if g:vimrc_repeat
    Plug 'tpope/vim-repeat'
  endif
  if g:vimrc_notational_fzf
    Plug '~/.fzf'
    Plug 'Alok/notational-fzf-vim'
  endif
  if g:vimrc_lightline
    Plug 'itchyny/lightline.vim'
    Plug 'mgedmin/taghelper.vim'
  endif
  if g:vimrc_lualine
    Plug 'nvim-lualine/lualine.nvim'
  endif
  if g:vimrc_gutentags
    Plug 'ludovicchabant/vim-gutentags'
  endif
  if g:vimrc_nio
    Plug 'nvim-neotest/nvim-nio'
  endif
  if g:vimrc_mason
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
  endif
  if g:vimrc_cmp
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'quangnguyen30192/cmp-nvim-tags'
  endif
  if g:vimrc_luasnip
    Plug 'L3MON4D3/LuaSnip'
  endif
  if g:vimrc_cmp && g:vimrc_luasnip
    Plug 'saadparwaiz1/cmp_luasnip'
  endif
  if g:vimrc_nvim_lspconfig
    Plug 'neovim/nvim-lspconfig'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', { 'branch': 'main' }
  endif
  if g:vimrc_which_key
    Plug 'folke/which-key.nvim', { 'branch': 'main' }
  endif
  if g:vimrc_telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    if executable('cmake')
      Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    else
      Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    endif
  endif
  if g:vimrc_polyglot
    let g:polyglot_disabled = ['python', 'autoindent', 'sensible']
    Plug 'sheerun/vim-polyglot'
  endif
  if g:vimrc_chadtree
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  endif
  if g:vimrc_trouble
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim', { 'branch': 'main' }
  endif
  if g:vimrc_treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  endif
  if g:vimrc_treesitter && g:vimrc_treesitter_context
    Plug 'nvim-treesitter/nvim-treesitter-context'
  endif
  if g:vimrc_treesitter && g:vimrc_treesitter_textobjects
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  endif
  if g:vimrc_dap
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'theHamsta/nvim-dap-virtual-text'
    Plug 'rcarriga/nvim-dap-ui'
  endif
  if g:vimrc_diffconflicts
    Plug 'whiteinge/diffconflicts'
  endif
  if g:vimrc_toggleterm
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
  endif
  if g:vimrc_overseer
    " TODO Move this to different section
    Plug 'stevearc/dressing.nvim'
    Plug 'stevearc/overseer.nvim'
  endif
  if g:vimrc_toggletasks
    Plug 'jedrzejboczar/toggletasks.nvim'
  endif
  if g:vimrc_asynctasks
    Plug 'skywind3000/asyncrun.vim'
    Plug 'skywind3000/asynctasks.vim'
    if g:vimrc_telescope
      Plug 'GustavoKatel/telescope-asynctasks.nvim'
    endif
  endif
  if g:vimrc_autosave
    Plug 'https://git.sr.ht/~nedia/auto-save.nvim'
  endif
  if g:vimrc_rope
    Plug 'python-rope/ropevim'
  endif
  if g:vimrc_ai
    Plug 'madox2/vim-ai'
  endif
  if g:vimrc_neotest
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'nvim-neotest/neotest'
    Plug 'nvim-neotest/neotest-python'
  endif
  if g:vimrc_copilot_lua
    Plug 'zbirenbaum/copilot.lua'
    " Plug 'zbirenbaum/copilot-cmp'
  endif
  if g:vimrc_copilot_vanilla
    Plug 'github/copilot.vim'
  endif
  if g:vimrc_surround
    Plug 'tpope/vim-surround'
  endif
  if g:vimrc_lint
    Plug 'mfussenegger/nvim-lint'
  endif
  if g:vimrc_yanky
    Plug 'gbprod/yanky.nvim'
  endif
  if g:vimrc_nui
    Plug 'MunifTanjim/nui.nvim'
  endif
  if g:vimrc_neotree
    Plug 'nvim-neo-tree/neo-tree.nvim'
  endif
  if g:vimrc_markview
    Plug 'OXY2DEV/markview.nvim'
  endif

  call plug#end()
endif


" *** Global configuration
set enc=utf-8
set tenc=utf-8

set number
set wrap

set magic
set incsearch
set ignorecase
set smartcase
set hlsearch

set splitright
set splitbelow

set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

if $TERM == "xterm" || $TERM == "screen-bce"
    set t_Co=256
endif

set wildmenu
set wildmode=full
set wildoptions=pum,tagfile

set breakindent
set breakindentopt=min:40
set linebreak
set showbreak=\ >>\ 

set notagrelative

set clipboard=unnamedplus

if g:vimrc_undofile
  set undofile
  if has('nvim')
    set undodir=~/.vim/undos_nvim/
  else
    set undodir=~/.vim/undos/
  endif
endif

if g:vimrc_mouse
  set mouse=a
endif " g:vimrc_mouse

set guifont=Monospace\ 9

if g:vimrc_colorscheme_wombat
  if has("gui_running")
    colorscheme wombat
  else
    colorscheme wombat256
  endif
endif " g:vimrc_colorscheme_wombat

if g:vimrc_console_title && !has("gui_running")
    " setting console window title
    if exists('$VIRTUAL_ENV')
        let &titlestring = toupper(fnamemodify($VIRTUAL_ENV, ":t")) . " - VIM"
    else
        let &titlestring = "VIM"
    endif
    set title
endif " g:vimrc_console_title

if g:vimrc_auto_readwrite
    set autoread
    set autowrite
endif " g:vimrc_auto_readwrite

if g:vimrc_colorscheme_wombat_mods
  highlight ColorColumn ctermbg=235 guibg=#303030
  if g:vimrc_lsp
    highlight lspReference ctermfg=white guifg=white ctermbg=darkgray guibg=darkgray
  endif
endif " g:vimrc_colorscheme_wombat_mods

if g:vimrc_colorscheme_gruvbox
  augroup colorscheme_gruvbox_override
      autocmd!
      autocmd ColorScheme * highlight Folded ctermfg=253 guifg=#dededd
  augroup END

  let g:gruvbox_italic = 1
  colorscheme gruvbox
  set background=dark
endif " g:vimrc_colorscheme_gruvbox

if g:vimrc_colorscheme_monokai
lua << EOF
require("monokai-pro").setup()
EOF
colorscheme monokai-pro
highlight NormalNC guibg=#222222
highlight LineNr guibg=NONE

augroup colorscheme_handle_focus
    autocmd!
    autocmd FocusLost * highlight Normal guibg=#222222
    autocmd FocusGained * highlight Normal guibg=#2d2a2e
augroup END
endif " g:vimrc_colorscheme_monokai

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END


" *** Plugins configuration
if g:vimrc_lsp
  if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'PYTHONPATH=${PYTHONPATH}:. pyls']},
          \ 'whitelist': ['python'],
          \ })
  endif

  if executable('clangd-10')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd-10', '-background-index']},
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
          \ })
  elseif executable('clangd-8')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd-8', '-background-index']},
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
          \ })
  elseif executable('clangd')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd', '-background-index']},
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
          \ })
  endif

  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
endif " g:vimrc_lsp

if g:vimrc_lsp_completion
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
endif " g:vimrc_lsp_completion

if g:vimrc_fzf
  let g:fzf_command_prefix = 'Fzf'
endif " g:vimrc_fzf

if g:vimrc_rainbow
  let g:rainbow_active = 1
  " disable rainbow for cmake (causes highlighting glitches)
  let g:rainbow_conf = {
        \	'separately': {
        \		'*': {},
        \		'cmake': 0,
        \		'htmldjango': 0,
        \		'css': 0,
        \	}
        \}
endif " g:vimrc_rainbow

if g:vimrc_git_utils
  augroup vimrc_git_utils_gitgutter
    autocmd!
    autocmd BufWritePost * GitGutter
  augroup END
endif " g:vimrc_git_utils

if g:vimrc_test_runner
  let test#python#runner = "pytest"
  let test#strategy = "neovim"
endif " g:vimrc_test_runner

if g:vimrc_commenter
  let g:tcomment_opleader1 = '<Leader>x'
endif " g:vimrc_commenter

if g:vimrc_vista
  let g:vista_ctags_executable = 'ctags-universal'
endif

if g:vimrc_custom_foldtext
  "" Taken from: http://gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/
  fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
      let line = getline(v:foldstart)
    else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
  endf

  set foldtext=CustomFoldText()
endif " g:vimrc_custom_foldtext

if g:vimrc_fast_fold
  let g:fastfold_savehook = 1
  let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
  let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
endif " g:vimrc_fast_fold

if g:vimrc_lightline
  set laststatus=2
  set noshowmode
  let g:lightline = {
    \ 'colorscheme': 'ayu_dark_modified',
    \ 'mode_map': {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste', 'filename' ],
    \             [ 'funcname' ],
    \             [ 'gitbranch', 'readonly', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
    \ },
    \ 'inactive': {
    \   'left': [ [ 'filename' ],
    \             [ 'funcname' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ] ],
    \ },
    \ 'tab': {
    \   'active': [ 'tabnum', 'filename', 'tabwinnum', 'modified' ],
    \   'inactive': [ 'tabnum', 'filename', 'tabwinnum', 'modified' ],
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead',
    \   'funcname': 'LightlineFuncname',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \ },
  \ }

  let g:lightline.tab_component_function = {
    \ 'filename': 'lightline#tab#filename',
    \ 'modified': 'lightline#tab#modified',
    \ 'readonly': 'lightline#tab#readonly',
    \ 'tabnum': 'lightline#tab#tabnum',
    \ 'tabwinnum': 'LightlineTabWinnr',
  \ }

  function! LightlineFuncname()
    let maxwidth = winwidth(0) - 60
    let l:maxwidth = l:maxwidth > 20 ? l:maxwidth : 20
    let funcname = taghelper#curtag()
    if l:funcname != ''
      let l:funcname = l:funcname[1:len(l:funcname) - 2]
      if len(l:funcname) > l:maxwidth
        let l:funcname = '<' . l:funcname[-l:maxwidth:]
      endif
    endif
    return l:funcname
  endfunction

  function! LightlineFileformat()
    return winwidth(0) > 130 ? &fileformat : ''
  endfunction

  function! LightlineFiletype()
    return winwidth(0) > 130 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  endfunction

  function! LightlineFileencoding()
    return winwidth(0) > 130 ? &fileencoding : ''
  endfunction

  function! LightlineTabWinnr(n)
    let tabwinnum = len(gettabinfo(a:n)[0]['windows'])
    return tabwinnum > 1 ? ('/' . tabwinnum) : ''
  endfunction
endif " g:vimrc_lightline

if g:vimrc_lualine
  set laststatus=3
lua << EOF
function dap_status()
    local dap = require('dap')
    local status = dap.status()

    if status ~= "" then
        return "DAP active"
    end
    return ""
end

local function neotest_status()
    if vim.g.test and vim.g.test.running then
        return 'Testing: ' .. vim.g.test.framework() .. ' (' .. vim.g.test.name() .. ')'
    end
    return ''
end

require('lualine').setup({
    sections = {
        lualine_a = {'mode', dap_status},
        lualine_b = {'branch', 'diff', 'diagnostics', neotest_status},
    },
})
EOF
endif " g:vimrc_lualine

if g:vimrc_gutentags
  let g:gutentags_ctags_exclude = ['.mypy_cache/*']
endif " g:vimrc_gutentags

if g:vimrc_mason
lua <<EOF
  require("mason").setup()
  require("mason-lspconfig").setup()
EOF
endif " g:vimrc_mason

if g:vimrc_cmp
lua <<EOF
  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  -- Set up nvim-cmp.
  local cmp = require 'cmp'
  local luasnip = require 'luasnip'

  cmp.setup({
    completion = {
      autocomplete = false,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      }),

    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "*LSP",
          luasnip = "*Snip",
          buffer = "*Buf",
          path = "*Path",
          cmp_git = "*Git",
          tags = "*Tag",
        })[entry.source.name]
        return vim_item
      end,
    },

    sources = cmp.config.sources({
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      {
        name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
      { name = 'tags' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
EOF
else
lua <<EOF
  cmp_capabilities = {}
EOF
endif " g:vimrc_cmp

if g:vimrc_nvim_lspconfig
" pip install python-lsp-server rope ropevim pylsp-mypy pyls-isort python-lsp-black pylsp-rope python-lsp-ruff
lua << EOF
  local lspconfig = require('lspconfig')

  lspconfig.gopls.setup({})
  --
  lspconfig.ruff_lsp.setup({
    capabilities = cmp_capabilities,
    autostart = true,
  })
  --
  lspconfig.jedi_language_server.setup({
    capabilities = cmp_capabilities,
    autostart = true,
    cmd = { "jedi-language-server", "-v", "--log-file", "/tmp/jedi-language-server.log" },
  })
  --
  lspconfig.pyright.setup({
    capabilities = cmp_capabilities,
    autostart = false,
    settings = {
      python = {
        analysis = {
          -- defaults from nvim-lspconfig
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'workspace',
          --
          venvPath = os.getenv("VIRTUAL_ENV") and vim.fs.dirname(os.getenv("VIRTUAL_ENV")),
          venv = os.getenv("VIRTUAL_ENV") and vim.fs.basename(os.getenv("VIRTUAL_ENV")),
        }
      }
    }
  })
  --
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'python',
    callback = function(args)
    vim.lsp.start({
      capabilities = cmp_capabilities,
      name = 'python_tags',
      cmd = {'python', '-m', 'tag_complete.language_server'},
      root_dir = vim.fs.root(args.buf, {'setup.py', 'pyproject.toml'}),
      autostart = true,
      filetypes = {'python'},
      single_file_support = true,
    })
    end,
  })
  --
  lspconfig.clangd.setup({
    capabilities = cmp_capabilities,
    cmd = { "clangd", '--background-index' }
  })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = false
    }
  )

  require('toggle_lsp_diagnostics').init()

  lspconfig.pyright.setup({autostart=false})
  --
  local on_attach = function(client)
      require'completion'.on_attach(client)
  end

  lspconfig.rust_analyzer.setup({
      on_attach = on_attach,
      settings = {
          ["rust-analyzer"] = {
              imports = {
                  granularity = {
                      group = "module",
                  },
                  prefix = "self",
              },
              cargo = {
                  buildScripts = {
                      enable = true,
                  },
              },
              procMacro = {
                  enable = true
              },
          }
      }
  })
  --
EOF
endif " g:vimrc_nvim_lspconfig

if g:vimrc_which_key
lua << EOF
  require("which-key").setup({})
EOF
endif " g:vimrc_which_key

if g:vimrc_telescope
lua << EOF
  require('telescope').setup({
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  })
  require('telescope').load_extension('fzf')
EOF

  if g:vimrc_trouble
lua << EOF
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local trouble = require("trouble.sources.telescope")

    local telescope = require("telescope")

    telescope.setup {
      defaults = {
          layout_strategy = "bottom_pane",
          layout_config = { height = 0.4 },
          cache_picker = {
            num_pickers = 20,
            ignore_empty_prompt = true,
          },
        mappings = {
          i = {
            ["<F3>"] = trouble.open,
            ["<A-a>"] = action_layout.cycle_layout_next,
            ["<A-s>"] = action_layout.toggle_preview,
          },
          n = {
            ["<F3>"] = trouble.open,
            ["<A-a>"] = action_layout.cycle_layout_next,
            ["<A-s>"] = action_layout.toggle_preview,
          },
        },
        cycle_layout_list = {
          { layout_strategy = "bottom_pane", layout_config = { height = 0.85 } },
          { layout_strategy = "bottom_pane", layout_config = { height = 0.4 } },
        },
      },
    }
EOF
  endif
endif " g:vimrc_telescope

if g:vimrc_trouble
lua << EOF
  require('trouble').setup({})
EOF
endif " g:vimrc_trouble

if g:vimrc_treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "python", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
endif

if g:vimrc_treesitter && g:vimrc_treesitter_context
lua << EOF
-- empty
EOF
endif " g:vimrc_treesitter && g:vimrc_treesitter_context

if g:vimrc_treesitter && g:vimrc_treesitter_textobjects
lua << EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --
        -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
        ["]o"] = "@loop.*",
        -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --
        -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
        ["]d"] = "@conditional.outer",
      },
      goto_previous = {
        ["[d"] = "@conditional.outer",
      }
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = true,
    },
  },
}
EOF
endif " g:vimrc_treesitter && g:vimrc_treesitter_textobjects

if g:vimrc_dap
lua << EOF
  require('dap-python').setup(vim.fn.executable('python') == 1 and 'python' or 'python3')
  require('dap-python').test_runner = 'pytest'
  local dap = require('dap')
  require("nvim-dap-virtual-text").setup({
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = true,                 -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
  })

  dap.configurations.python = {
    {
      type = 'python';
      request = 'attach';
      name = 'Attach remote (default params)';
      connect = function()
        return {host = '127.0.0.1', port = 5678}
      end;
    },
  }
  require("dapui").setup()
  require("dap.ext.vscode").load_launchjs('./launch.json')
EOF
endif  " g:vimrc_dap

if g:vimrc_toggleterm
lua << EOF
  require('toggleterm').setup({
    open_mapping = [[<C-Enter>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
  })
EOF
endif " g:vimrc_toggleterm

if g:vimrc_overseer
lua << EOF
  require('dressing').setup({
    input = {
      win_options = {
        winblend = 0,
        wrap = false,
      },
    },
    select = {
      backend = {'bultin'},
      builtin = {
        -- These are passed to nvim_open_win
        anchor = "NW",
        border = "rounded",
        -- 'editor' and 'win' will default to being centered
        relative = "editor",

        buf_options = {},
        win_options = {
          -- Window transparency (0-100)
          winblend = 0,
        },
      },
    },
  })
  require('overseer').setup({
    strategy = "toggleterm",
    form = {
      win_opts = {
        winblend = 0,
      },
    },
    confirm = {
      win_opts = {
        winblend = 0,
      },
    },
    task_win = {
      win_opts = {
        winblend = 0,
      },
    },
    default_template_prompt = "always",
  })
EOF
endif " g:vimrc_overseer

if g:vimrc_toggletasks
lua <<EOF
  require('toggletasks').setup{
    toggleterm = {
      hidden = false,
    },
  }
  require('telescope').load_extension('toggletasks')
EOF
endif " g:vimrc_toggletasks

if g:vimrc_asynctasks
lua <<EOF
  function wezterm_run(opts)
    print("Running " .. opts.cmd)
    local cmd = "wezterm cli spawn --cwd " .. vim.fn.getcwd() .. " -- term-runner -- " .. opts.cmd
    print("Full command: " .. cmd)
    vim.fn.system(cmd)
  end
EOF

let g:asyncrun_runner = get(g:, 'asyncrun_runner', {})
let g:asyncrun_runner.wezterm = {opts -> luaeval('wezterm_run(_A)', opts)}
let g:asynctasks_term_pos = 'wezterm'

endif " g:vimrc_asynctasks

if g:vimrc_autosave
lua <<EOF
require("auto-save").setup({
  events = { "InsertLeave", "BufLeave", "WinLeave", "TabLeave", "FocusLost" },
  exclude_ft = { "neo-tree", "OverseerForm" },
})
EOF
endif " g:vimrc_autosave

if g:vimrc_neotest
lua <<EOF
require("neotest").setup({
  adapters = {
    require("neotest-python")
  },
  quickfix = {
    open = false,
  },
  output = {
    open_on_run = false,
  },
})
EOF
endif " g:vimrc_neotest

if g:vimrc_copilot_lua
lua <<EOF
require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
  }
})
-- require("copilot_cmp").setup()
EOF
endif " g:vimrc_copilot_lua

if g:vimrc_copilot_vanilla
  let g:copilot_no_tab_map = v:true
endif " g:vimrc_copilot_vanilla

if g:vimrc_lint
lua <<EOF
require('lint').linters_by_ft = {
  python = {'mypy',}
}
local mypy_ns = require("lint").get_namespace("mypy")
vim.diagnostic.config({underline = false}, mypy_ns)
EOF
autocmd BufWritePost *.py lua require('lint').try_lint()
endif " g:vimrc_lint

if g:vimrc_yanky
lua << EOF
require('yanky').setup({})
EOF
endif " g:vimrc_yanky

if g:vimrc_neotree
lua << EOF
EOF
endif " g:vimrc_neotree

if g:vimrc_markview
lua << EOF
require("markview").setup({
    modes = { "n", "no", "c" }, -- Change these modes
                                -- to what you need
    hybrid_modes = { "n" },     -- Uses this feature on
                                -- normal mode
    -- This is nice to have
    callbacks = {
        on_enable = function (_, win)
            vim.wo[win].conceallevel = 2;
            vim.wo[win].conecalcursor = "c";
        end
    }
})
EOF
endif " g:vimrc_markview

" *** Keybindings

" Use <Space> to input commands
nnoremap <Space> :
vnoremap <Space> :

" Insert mode exiting
imap fj <Esc>
inoremap <Leader>fj fj

" Alternative <Leader> key
map , <Leader>

noremap gr gT

map <Leader>gT :tabnew<CR>
map <Leader>T :tab split<CR>

noremap go o<Esc>
noremap gO O<Esc>

noremap <silent> g^ :tabfirst<CR>
noremap <silent> g$ :tablast<CR>

noremap <F12> :set paste!<CR>:set paste?<CR>
inoremap <F12> <Esc>:set paste!<CR>:set paste?<CR>a
vnoremap <F12> :set paste!<CR>:set paste?<CR>
cnoremap <F12> :set paste!<CR>:set paste?<CR>

nnoremap <silent> ]q <CMD>cnext<CR>
nnoremap <silent> [q <CMD>cprevious<CR>
nnoremap <silent> ]Q <CMD>cbelow<CR>
nnoremap <silent> [Q <CMD>cabove<CR>
nnoremap <silent> <Leader>q <CMD>copen<CR>

nnoremap <silent> ]w <CMD>lnext<CR>
nnoremap <silent> [w <CMD>lprevious<CR>
nnoremap <silent> ]W <CMD>lbelow<CR>
nnoremap <silent> [W <CMD>labove<CR>
nnoremap <silent> <Leader>w <CMD>lopen<CR>

tnoremap <silent> <C-\><BS> <C-\><C-n>
tnoremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

nnoremap <silent> H gT
nnoremap <silent> L gt

nnoremap <silent> gh H
nnoremap <silent> gl L

if g:vimrc_lsp
    map <Leader>ld <plug>(lsp-definition)
    map <Leader>lD <plug>(lsp-declaration)
    map <Leader>lA <plug>(lsp-code-action)
    map <Leader>lC <plug>(lsp-document-diagnostics)
    map <Leader>lF <plug>(lsp-document-format)
    map <Leader>lr <plug>(lsp-reference)
    map <Leader>lh <plug>(lsp-hover)
    map <Leader>ls <plug>(lsp-document-symbol)
    map <Leader>lS <plug>(lsp-workspace-symbol)
endif " g:vimrc_lsp

if g:vimrc_lsp_completion
  imap <C-Space> <Plug>(asyncomplete_force_refresh)
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
endif " g:vimrc_lsp_completion

if g:vimrc_fzf
  nmap <C-p> :FzfFiles<CR>
  nmap <C-p><C-p> :FzfFiles<CR>
  nmap <C-p>f :FzfFiles<CR>
  nmap <C-p>b :FzfBuffers<CR>
  nmap <C-p>G :FzfGFiles<CR>
  nmap <C-p>g :FzfGFiles?<CR>
  nmap <C-p>t :FzfBTags<CR>
  nmap <C-p>T :FzfTags<CR>
endif " g:vimrc_fzf

if g:vimrc_rainbow
  noremap <Leader>p :RainbowToggle<CR>
endif " g:vimrc_rainbow

if g:vimrc_alternates
  noremap <Leader>aa :A<CR>
  noremap <Leader>av :AV<CR>
  noremap <Leader>as :AS<CR>
  noremap <Leader>at :AT<CR>
endif " g:vimrc_alternates

if g:vimrc_git_utils
  " Gitgutter showing changes and hunks navigation
  nmap <silent> <Leader>hh :GitGutter<CR>
  nmap ]h <Plug>(GitGutterNextHunk)
  nmap [h <Plug>(GitGutterPrevHunk)
  nmap <Leader>hs <Plug>(GitGutterStageHunk)
  nmap <Leader>hu <Plug>(GitGutterUndoHunk)
  nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
  omap ih <Plug>(GitGutterTextObjectInnerPending)
  omap ah <Plug>(GitGutterTextObjectOuterPending)
  xmap ih <Plug>(GitGutterTextObjectInnerVisual)
  xmap ah <Plug>(GitGutterTextObjectOuterVisual)

  " GV bindings (general navigation, current file only, file revisions list)
  nmap <Leader>ht :GV<CR>
  vmap <Leader>ht :GV<CR>
  nmap <Leader>hc :GV!<CR>
  vmap <Leader>hc :GV!<CR>
  nmap <Leader>hr :GV?<CR>
  vmap <Leader>hr :GV?<CR>
  nmap <Leader>GG <Cmd>vertical topleft Git<CR>
endif " g:vimrc_git_utils

if g:vimrc_test_runner
  nmap <F8>n :TestNearest
  nmap <F8>f :TestFile
  nmap <F8>l :TestLast
  nmap <F8><F8> :TestLast
endif " g:vimrc_test_runner

if g:vimrc_commenter
  nmap <Leader>xx <Leader>xc
endif " g:vimrc_commenter

if g:vimrc_ctrlsf
  nmap <C-F>f <Plug>CtrlSFPrompt
  vmap <C-F>f <Plug>CtrlSFVwordPath
  vmap <C-F>F <Plug>CtrlSFVwordExec
  nmap <C-F>n <Plug>CtrlSFCwordPath
  nmap <C-F>p <Plug>CtrlSFPwordPath
  nnoremap <C-F>o :CtrlSFOpen<CR>
  nnoremap <C-F>t :CtrlSFToggle<CR>
  inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
  map <C-F>  <nop>
endif

if g:vimrc_vista
  nnoremap <silent> <F7> :Vista!!<CR>
  nnoremap <silent> g<F7> :Vista vim_lsp<CR>
  nnoremap <silent> <C-p>y :Vista finder<CR>
  nnoremap <silent> <C-p>Y :Vista finder vim_lsp<CR>
endif

if g:vimrc_fast_fold
  nmap zuz <Plug>(FastFoldUpdate)
endif " g:vimrc_fast_fold


if g:vimrc_notational_fzf
  " taking notes
  nnoremap <silent> <C-p>n :NV<CR>
  " fullscreen version
  nnoremap <silent> <C-p>N :NV!<CR>
  " bindings inside search window:
  "  - <C-x> create new
  "  - <C-v> open vertical
  "  - <C-s> open horizontal
  "  - <C-t> open tab
  "  - <C-y> yank selected filename
  "  - <Enter> open in current buffer
endif " g:vimrc_notational_fzf

if g:vimrc_luasnip
lua << EOF
  local luasnip = require('luasnip')
  vim.keymap.set(
    {"i", "s"}, "<A-`>", function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      end
    end
  )
  vim.keymap.set(
    {"i", "s"}, "<A-~>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end
  )
EOF
endif " g:vimrc_luasnip

if g:vimrc_nvim_lspconfig
  nnoremap <silent> <Backspace>w <CMD>lua vim.lsp.set_loclist()<CR>
  nnoremap <silent> <Backspace><Backspace> <CMD>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> <Backspace>e <CMD>lua vim.diagnostic.open_float()<CR>
  nnoremap <silent> <Backspace>d <CMD>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <Backspace>R <CMD>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> <Backspace>= <CMD>lua vim.lsp.buf.format({async = true })<CR>
  nnoremap <silent> <Backspace>a <CMD>lua vim.lsp.buf.code_action()<CR>
  nnoremap <silent> <Backspace>K <CMD>lua vim.lsp.buf.signature_help()<CR>

  if g:vimrc_telescope
    nnoremap <silent> <Backspace>r <CMD>Telescope lsp_references<CR>
    nnoremap <silent> <C-p>s <CMD>Telescope lsp_document_symbols<CR>
    nnoremap <silent> <C-p>S <CMD>Telescope lsp_dynamic_workspace_symbols<CR>
  endif " g:vimrc_telescope
endif " g:vimrc_nvim_lspconfig

if g:vimrc_telescope
  " Find files using Telescope command-line sugar.
  nnoremap <silent> <C-p>p <cmd>Telescope find_files<cr>
  nnoremap <silent> <C-p><C-p> <cmd>Telescope find_files<cr>
  nnoremap <silent> <C-p>, <cmd>Telescope builtin<cr>
  nnoremap <silent> <C-p>F <cmd>Telescope live_grep<cr>
  nnoremap <silent> <C-p>b <cmd>Telescope buffers<cr>
  nnoremap <silent> <C-p>h <cmd>Telescope help_tags<cr>
  nnoremap <silent> <C-p>t <cmd>Telescope current_buffer_tags<cr>
  nnoremap <silent> <C-p>T <cmd>Telescope tags<cr>
  nnoremap <silent> <C-p>g <cmd>Telescope git_status<cr>
  nnoremap <silent> <C-p>G <cmd>Telescope git_files<cr>
  nnoremap <silent> <C-p><Enter> <cmd>Telescope resume<cr>
  nnoremap <silent> <C-p><C-Enter> <cmd>Telescope pickers<cr>
  nnoremap <silent> <C-p>c <cmd>Telescope git_bcommits_range<cr>
  vnoremap <silent> <C-p>c <cmd>Telescope git_bcommits_range<cr>
  vnoremap <silent> <C-p>q <cmd>Telescope quickfix<cr>
  vnoremap <silent> <C-p>Q <cmd>Telescope quickfixhistory<cr>
  vnoremap <silent> <C-p>w <cmd>Telescope loclist<cr>
  vnoremap <silent> <C-p>o <cmd>Telescope oldfiles<cr>
  vnoremap <silent> <C-p>m <cmd>Telescope marks<cr>
  vnoremap <silent> <C-p>E <cmd>Telescope diagnostics<cr>
endif " g:vimrc_telescope

if g:vimrc_chadtree
  nnoremap <F9> <cmd>CHADopen<cr>
endif " g:vimrc_chadtree

if g:vimrc_trouble
  nnoremap <F3><F3> <CMD>TroubleToggle<CR>
  nnorema <F3>f <CMD>TroubleToggle document_diagnostics<CR>
  nnoremap <F3>F <CMD>TroubleToggle workspace_diagnostics<CR>
  nnoremap <F3>q <CMD>TroubleToggle quickfix<CR>
  nnoremap <F3>w <CMD>TroubleToggle loclist<CR>
endif " g:vimrc_trouble

if g:vimrc_dap
    nnoremap <silent> <Leader>db <Cmd>lua require('dap').toggle_breakpoint()<CR>
    nnoremap <silent> <Leader>di <Cmd>lua require('dap').step_into()<CR>
    nnoremap <silent> <Leader>do <Cmd>lua require('dap').step_out()<CR>
    nnoremap <silent> <Leader>dd <Cmd>lua require('dap').step_over()<CR>
    nnoremap <silent> <Leader>dc <Cmd>lua require('dap').continue()<CR>
    nnoremap <silent> <Leader>dR <Cmd>lua require('dap').repl.open()<CR>
    nnoremap <silent> <Leader>dT <Cmd>lua require('dap').terminate()<CR>
    nnoremap <silent> <Leader>dU <Cmd>lua require('dapui').toggle()<CR>
    nnoremap <silent> <Leader>de <Cmd>lua require('dapui').eval()<CR>

    nnoremap <silent> g<F8>l <Cmd>lua require('dap').run_last()<CR>
    nnoremap <silent> g<F8><F8> <Cmd>lua require('dap').run_last()<CR>

    augroup vimrc_dap_python
        autocmd!
        autocmd FileType python nnoremap <buffer><silent> g<F8>n <Cmd>lua require('dap-python').test_method()<CR>
        autocmd FileType python nnoremap <buffer><silent> g<F8>f <Cmd>lua require('dap-python').test_class()<CR>
    augroup END
endif " g:vimrc_dap

if g:vimrc_overseer
  nnoremap <silent> <F5> :OverseerRun<CR>
  nnoremap <silent> <F6> :OverseerToggle<CR>
endif " g:vimrc_overseer

if g:vimrc_toggletasks
  nnoremap <silent> <F6> :Telescope toggletasks spawn<CR>
  nnoremap <silent> g<F6> :Telescope toggletasks select<CR>
  nnoremap <silent> <Leader><F6>e :Telescope toggletasks edit<CR>
endif " g:vimrc_toggletasks

if g:vimrc_asynctasks
  nnoremap <silent> <F5> :AsyncTaskLast<CR>
  nnoremap <silent> g<F6> :AsyncTaskList<CR>
  if g:vimrc_telescope
    nnoremap <silent> <F6> :Telescope asynctasks all<CR>
  endif " g:vimrc_telescope
endif " g:vimrc_asynctasks

if g:vimrc_neotest
  nnoremap <Leader>tt <Cmd>lua require('neotest').run.run()<CR>
  nnoremap <Leader>tT <Cmd>lua require('neotest').run.run({strategy = "dap"})<CR>
  nnoremap <Leader>tf <Cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>
  nnoremap <Leader>tF <Cmd>lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})<CR>
  nnoremap <Leader>tr <Cmd>lua require("neotest").run.run_last()<CR>
  nnoremap <Leader>tR <Cmd>lua require("neotest").run.run_last({strategy = "dap"})<CR>
  nnoremap <Leader>to <Cmd>lua require("neotest").output.open()<CR>
  nnoremap <Leader>tO <Cmd>lua require("neotest").output_panel.toggle()<CR>
  nnoremap <Leader>tS <Cmd>lua require("neotest").summary.toggle()<CR>
  nnoremap <Leader>ta <Cmd>lua require("neotest").run.attach()<CR>
endif " g:vimrc_neotest

if g:vimrc_treesitter && g:vimrc_treesitter_context
lua << EOF
  vim.keymap.set("n", "[C", function()
    require("treesitter-context").go_to_context(vim.v.count1)
  end, { silent = true })
EOF
endif " g:vimrc_treesitter && g:vimrc_treesitter_context

if g:vimrc_yanky
lua << EOF
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<Leader>p", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<Leader>n", "<Plug>(YankyNextEntry)")
vim.keymap.set("n", "<A-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<A-P>", "<Plug>(YankyNextEntry)")
EOF
endif " g:vimrc_yanky

if g:vimrc_neotree
nnoremap <C--> :Neotree filesystem reveal float toggle<CR>
nnoremap <F1> :Neotree filesystem reveal left toggle<CR>
endif " g:vimrc_neotree
