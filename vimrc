set nocompatible
set exrc

" *** VIMRC controls
let g:vimrc_mouse = 1
let g:vimrc_colorscheme = 1
let g:vimrc_colorscheme_mods = 1
let g:vimrc_console_title = 1
let g:vimrc_load_plugins = 1
let g:vimrc_lsp = g:vimrc_load_plugins && 1
let g:vimrc_lsp_completion = g:vimrc_lsp && 1
let g:vimrc_fzf = 1

if g:vimrc_fzf && !isdirectory($HOME . "/.fzf")
  echo "WARN: vimrc_fzf enabled but ~/.fzf is not found"
  let g:vimrc_fzf = 0
endif


if g:vimrc_load_plugins
  call plug#begin('~/.vim/plugged')
  if g:vimrc_lsp
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
  endif
  if g:vimrc_lsp_completion
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
  endif
  call plug#end()
endif


" *** Global configuration
set enc=utf-8
set tenc=utf-8

set number
set wrap

if $TERM == "xterm" || $TERM == "screen-bce"
    set t_Co=256
endif

if g:vimrc_mouse
  set mouse=a
endif " g:vimrc_mouse

if g:vimrc_colorscheme
  if has("gui_running")
      colorscheme wombat
      if filereadable(expand("~/.fonts/DejaVu Sans Mono for Powerline.ttf"))
          set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
      else
          set guifont=Monospace\ 9
      endif
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

if g:vimrc_fzf && isdirectory("~/.fzf")
  let g:fzf_command_prefix = 'Fzf'
endif " g:vimrc_fzf


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

noremap go o<Esc>
noremap gO O<Esc>

noremap <silent> g^ :tabfirst<CR>
noremap <silent> g$ :tablast<CR>

if g:vimrc_lsp_completion
  imap <C-Space> <Plug>(asyncomplete_force_refresh)
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
endif " g:vimrc_lsp_completion

if g:vimrc_fzf
  nmap <C-p> :FzfGFiles<CR>
  nmap <C-p><C-p> :FzfGFiles<CR>
  nmap <C-p>f :FzfFiles<CR>
  nmap <C-p>b :FzfBuffers<CR>
  nmap <C-p>g :FzfGFiles<CR>
  nmap <C-p>G :FzfGFiles?<CR>
  nmap <C-p>t :FzfTags<CR>
endif " g:vimrc_fzf
