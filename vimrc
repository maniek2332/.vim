" vim: sw=2
set nocompatible
set exrc

" *** VIMRC controls
let g:vimrc_undofile = 1
let g:vimrc_mouse = 1
let g:vimrc_colorscheme_wombat = 0
let g:vimrc_colorscheme_wombat_mods = 0
let g:vimrc_console_title = 1
let g:vimrc_auto_readwrite = 1
let g:vimrc_load_plugins = 1
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
let g:vimrc_test_runner = g:vimrc_load_plugins && 0
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
let g:vimrc_lightline = g:vimrc_load_plugins && 1
let g:vimrc_gutentags = g:vimrc_load_plugins && 1
let g:vimrc_colorscheme_gruvbox = g:vimrc_load_plugins && 1

let g:vimrc_nvim_lspconfig = g:vimrc_load_nvim_plugins && 1
let g:vimrc_compe = g:vimrc_load_nvim_plugins && 1
let g:vimrc_vsnip = g:vimrc_load_nvim_plugins && 1
let g:vimrc_which_key = g:vimrc_load_nvim_plugins && 0
let g:vimrc_telescope = g:vimrc_load_nvim_plugins && 1
let g:vimrc_polyglot = g:vimrc_load_nvim_plugins && 1
let g:vimrc_chadtree = g:vimrc_load_nvim_plugins && 0
let g:vimrc_trouble = g:vimrc_load_nvim_plugins && 1

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
  if g:vimrc_gutentags
    Plug 'ludovicchabant/vim-gutentags'
  endif
  if g:vimrc_nvim_lspconfig
    Plug 'neovim/nvim-lspconfig'
    Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', { 'branch': 'main' }
  endif
  if g:vimrc_compe
    Plug 'hrsh7th/nvim-compe'
  endif
  if g:vimrc_vsnip
    Plug 'hrsh7th/vim-vsnip'
    Plug 'rafamadriz/friendly-snippets', { 'branch': 'main' }
  endif
  if g:vimrc_which_key
    Plug 'folke/which-key.nvim', { 'branch': 'main' }
  endif
  if g:vimrc_telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
  endif
  if g:vimrc_polyglot
    Plug 'sheerun/vim-polyglot'
  endif
  if g:vimrc_chadtree
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  endif
  if g:vimrc_trouble
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim', { 'branch': 'main' }
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

    augroup vimrc_auto_readwrite
        autocmd!
        autocmd FocusGained,BufEnter * :silent! !
        autocmd FocusLost,WinLeave * :silent! noautocmd update
    augroup END
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
  let test#strategy = "vimterminal"
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

if g:vimrc_nvim_lspconfig
lua << EOF
  local lspconfig = require('lspconfig')

  -- lspconfig.pylsp.setup(coq.lsp_ensure_capabilities({}))
  -- lspconfig.pylsp.setup({})
  -- lspconfig.jedi_language_server.setup({})
  lspconfig.gopls.setup({})
  lspconfig.pyright.setup({})
  for idx, clangd_suffix in pairs({"-14", "-13", "-12", "-11", "-10", "-9", ""}) do
    if vim.fn.executable("clangd" .. clangd_suffix) == 1 then
      lspconfig.clangd.setup({cmd = { "clangd" .. clangd_suffix, '--background-index' }})
      break
    end
  end

  require('toggle_lsp_diagnostics').init()
EOF
endif " g:vimrc_coq_completion

if g:vimrc_compe
  set completeopt=menuone,noselect

  let g:compe = {}
  let g:compe.enabled = v:true
  let g:compe.autocomplete = v:true
  let g:compe.debug = v:false
  let g:compe.min_length = 1
  let g:compe.preselect = 'enable'
  let g:compe.throttle_time = 80
  let g:compe.source_timeout = 200
  let g:compe.resolve_timeout = 800
  let g:compe.incomplete_delay = 400
  let g:compe.max_abbr_width = 100
  let g:compe.max_kind_width = 100
  let g:compe.max_menu_width = 100
  let g:compe.documentation = v:true

  let g:compe.source = {}
  let g:compe.source.path = v:true
  let g:compe.source.buffer = v:true
  let g:compe.source.calc = v:true
  let g:compe.source.nvim_lsp = v:true
  let g:compe.source.nvim_lua = v:true
  let g:compe.source.vsnip = g:vimrc_vsnip
  let g:compe.source.ultisnips = v:false
  let g:compe.source.luasnip = v:false
  let g:compe.source.emoji = v:false
endif " g:vimrc_compe

if g:vimrc_compe && g:vimrc_vsnip
lua << EOF
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
      local col = vim.fn.col('.') - 1
      return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn['vsnip#available'](1) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end
  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t "<S-Tab>"
    end
  end
EOF
endif " g:vimrc_compe && g:vimrc_vsnip

if g:vimrc_which_key
lua << EOF
  require("which-key").setup({})
EOF
endif " g:vimrc_which_key

if g:vimrc_telescope
lua << EOF
  require('telescope').setup({})
EOF

  if g:vimrc_trouble
lua << EOF
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    local telescope = require("telescope")

    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<F3>"] = trouble.open_with_trouble },
          n = { ["<F3>"] = trouble.open_with_trouble },
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

map <Leader>t :tabnew<CR>
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
endif " g:vimrc_git_utils

if g:vimrc_test_runner
  nmap <F8>n :TestNearest --reuse-db
  nmap <F8>f :TestFile --reuse-db
  nmap <F8>l :TestLast --reuse-db
  nmap <F8><F8> :TestLast --reuse-db
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

if g:vimrc_nvim_lspconfig
  nnoremap <silent> <Backspace>w <CMD>lua vim.lsp.set_loclist()<CR>
  nnoremap <silent> <Backspace><Backspace> <CMD>lua vim.lsp.buf.hover()<CR>

  if g:vimrc_telescope
    nnoremap <silent> <Backspace>r <CMD>Telescope lsp_references<CR>
    nnoremap <silent> <Backspace>d <CMD>Telescope lsp_definitions<CR>
    nnoremap <silent> <Backspace>f <CMD>Telescope lsp_document_symbols<CR>
    nnoremap <silent> <Backspace>F :Telescope lsp_workspace_symbols query=
  endif " g:vimrc_telescope
endif " g:vimrc_nvim_lspconfig

if g:vimrc_compe
  inoremap <silent><expr> <C-Space> compe#complete()
  inoremap <silent><expr> <CR>      compe#confirm('<CR>')
  inoremap <silent><expr> <C-e>     compe#close('<C-e>')
  inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
  inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
endif " g:vimrc_compe

if g:vimrc_compe && g:vimrc_vsnip
  imap <expr> <Tab> v:lua.tab_complete()
  smap <expr> <Tab> v:lua.tab_complete()
  imap <expr> <S-Tab> v:lua.s_tab_complete()
  smap <expr> <S-Tab> v:lua.s_tab_complete()
endif " g:vimrc_compe && g:vimrc_vsnip

if g:vimrc_telescope
  " Find files using Telescope command-line sugar.
  nnoremap <silent> <C-p>p <cmd>Telescope find_files<cr>
  nnoremap <silent> <C-p><C-p> <cmd>Telescope find_files<cr>
  nnoremap <silent> <C-p>F <cmd>Telescope live_grep<cr>
  nnoremap <silent> <C-p>b <cmd>Telescope buffers<cr>
  nnoremap <silent> <C-p>h <cmd>Telescope help_tags<cr>
  nnoremap <silent> <C-p>t <cmd>Telescope current_bufffer_tags<cr>
  nnoremap <silent> <C-p>T <cmd>Telescope tags<cr>
  nnoremap <silent> <C-p>g <cmd>Telescope git_status<cr>
  nnoremap <silent> <C-p>G <cmd>Telescope git_files<cr>
endif " g:vimrc_telescope

if g:vimrc_chadtree
  nnoremap <F9> <cmd>CHADopen<cr>
endif " g:vimrc_chadtree

if g:vimrc_trouble
  nnoremap <F3><F3> <CMD>TroubleToggle<CR>
  nnorema <F3>f <CMD>TroubleToggle lsp_document_diagnostics<CR>
  nnoremap <F3>F <CMD>TroubleToggle lsp_workspace_diagnostics<CR>
  nnoremap <F3>q <CMD>TroubleToggle quickfix<CR>
  nnoremap <F3>w <CMD>TroubleToggle loclist<CR>
endif " g:vimrc_trouble
