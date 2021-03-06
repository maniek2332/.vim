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
let g:vimrc_lsp = g:vimrc_load_plugins && 1
let g:vimrc_lsp_completion = g:vimrc_lsp && 1
let g:vimrc_fzf = g:vimrc_load_plugins && 1
let g:vimrc_python_indent = g:vimrc_load_plugins && 1
let g:vimrc_cython_syntax = g:vimrc_load_plugins && 1
let g:vimrc_cmake_syntax = g:vimrc_load_plugins && 1
let g:vimrc_rainbow = g:vimrc_load_plugins && 1
let g:vimrc_alternates = g:vimrc_load_plugins && 1
let g:vimrc_git_utils = g:vimrc_load_plugins && 1
let g:vimrc_test_runner = g:vimrc_load_plugins && 1
let g:vimrc_commenter = g:vimrc_load_plugins && 1
let g:vimrc_ctrlsf = g:vimrc_load_plugins && 1
let g:vimrc_vista = g:vimrc_load_plugins && 1
let g:vimrc_python_fold = g:vimrc_load_plugins && 1
let g:vimrc_custom_foldtext = g:vimrc_load_plugins && 1
let g:vimrc_fast_fold = g:vimrc_load_plugins && 1
let g:vimrc_sneak = g:vimrc_load_plugins && 1
let g:vimrc_surround = g:vimrc_load_plugins && 1
let g:vimrc_repeat = g:vimrc_load_plugins && 1
let g:vimrc_notational_fzf = g:vimrc_load_plugins && 1
let g:vimrc_lightline = g:vimrc_load_plugins && 1
let g:vimrc_gutentags = g:vimrc_load_plugins && 1
let g:vimrc_colorscheme_gruvbox = g:vimrc_load_plugins && 1

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
    Plug 'Alok/notational-fzf-vim'
  endif
  if g:vimrc_lightline
    Plug 'itchyny/lightline.vim'
    Plug 'mgedmin/taghelper.vim'
  endif
  if g:vimrc_gutentags
    Plug 'ludovicchabant/vim-gutentags'
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
set wildmode=list:longest,full

if g:vimrc_undofile
  set undofile
  set undodir=~/.vim/undos/
endif

if g:vimrc_mouse
  set mouse=a
endif " g:vimrc_mouse

if g:vimrc_colorscheme_wombat
  if has("gui_running")
    colorscheme wombat
    set guifont=Monospace\ 9
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
