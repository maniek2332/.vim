set nocompatible
set exrc

" *** VIMRC controls
let g:vimrc_undofile = 1
let g:vimrc_mouse = 1
let g:vimrc_colorscheme = 1
let g:vimrc_colorscheme_mods = 1
let g:vimrc_console_title = 1
let g:vimrc_load_plugins = 1
let g:vimrc_lsp = g:vimrc_load_plugins && 1
let g:vimrc_lsp_completion = g:vimrc_lsp && 1
let g:vimrc_fzf = g:vimrc_load_plugins && 1
let g:vimrc_python_indent = g:vimrc_load_plugins && 1
let g:vimrc_cython_syntax = g:vimrc_load_plugins && 1
let g:vimrc_cmake_syntax = g:vimrc_load_plugins && 1
let g:vimrc_rainbow = g:vimrc_load_plugins && 1
let g:vimrc_alternates = g:vimrc_load_plugins && 1

if g:vimrc_fzf && !isdirectory($HOME . "/.fzf")
  echo "WARN: vimrc_fzf enabled but ~/.fzf is not found"
  let g:vimrc_fzf = 0
endif


if g:vimrc_load_plugins
  call plug#begin('~/.vim/plugged')
  Plug 'LucHermitte/lh-vim-lib'
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

if g:vimrc_undofile
  set undofile
  set undodir=~/.vim/undos/
endif

if g:vimrc_mouse
  set mouse=a
endif " g:vimrc_mouse

if g:vimrc_colorscheme
  if has("gui_running")
    colorscheme wombat
    set guifont=Monospace\ 9
  else
    colorscheme wombat256
  endif
endif " g:vimrc_colorscheme

if g:vimrc_console_title && !has("gui_running")
    " setting console window title
    if exists('$VIRTUAL_ENV')
        let &titlestring = toupper(fnamemodify($VIRTUAL_ENV, ":t")) . " - VIM"
    else
        let &titlestring = "VIM"
    endif
    set title
endif " g:vimrc_console_title

if g:vimrc_colorscheme_mods
  highlight ColorColumn ctermbg=235 guibg=#303030
  if g:vimrc_lsp
    highlight lspReference ctermfg=white guifg=white ctermbg=darkgray guibg=darkgray
  endif
endif " g:vimrc_colorscheme_mods

" *** Plugins configuration
if g:vimrc_lsp
  if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': ['python'],
          \ })
  endif

  if executable('clangd-8')
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
  nmap <C-p>g :FzfGFiles<CR>
  nmap <C-p>G :FzfGFiles?<CR>
  nmap <C-p>t :FzfTags<CR>
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
