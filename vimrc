set exrc
set nocompatible
set number

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'alfredodeza/coveragepy.vim'
Bundle 'vim-scripts/hexman.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'klen/python-mode'
Bundle 'vim-scripts/tabops'
Bundle 'basepi/vim-conque'
Bundle 'vim-scripts/LargeFile'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/taglist.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Rykka/riv.vim'

syntax on

set bs=indent,eol,start
set wrap

set smartindent

filetype indent on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

set magic "Set magic on, for regular expressions
set incsearch
set ignorecase
set smartcase
set hlsearch

set enc=utf-8
set tenc=utf-8

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

"set hidden

set laststatus=2

" autofolding
"set foldmethod=indent
"set foldlevel=99
"set foldnestmax=2

"highlight Pmenu ctermbg=238
"highlight PmenuSel ctermbg=4
"highlight PmenuSbar ctermbg=4
"highlight Pmenu ctermfg=2 

if $TERM == "xterm" || $TERM == "screen-bce"
    set t_Co=256
endif
if has("gui_running")
    colorscheme wombat
    set guifont=Monospace\ 9
else
    colorscheme wombat256
endif

"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"

set wildmenu
set completeopt=longest,menuone,menu,preview

set history=300
set autoread
set ruler

set tabpagemax=20 "Maximum number of on-start opened tabs

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-c> pumvisible() ? "\<C-e>" : "\<C-g>u\<C-c>"

" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=~/.vim/tags/cpp2
"set tags+=~/.vim/tags/tags.python
"set tags+=~/.vim/tags/tags.django
"set tags+=~/.vim/tags/es
"set tags=~/.vim/tags/pytags,~/.vim/tags/es
" build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let g:bufExplorerFindActive=0

" OmniCppComplete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_MayCompleteDot = 1
"let OmniCpp_MayCompleteArrow = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

autocmd VimLeavePre * mksession! ~/.vim/session_last.vim

"let g:myterm="terminal -e"

let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E124,E127,W391'

"""" Python specific

"" rope completion
"autocmd FileType python setlocal omnifunc=RopeCompleteFunc
autocmd FileType python noremap <Leader>B Oimport pdb; pdb.set_trace()  ## XXX<Esc>
autocmd FileType python setlocal list listchars=trail:·,tab:·\ 

"Pyer (executing python from vim)
python << EOL
import vim, StringIO, sys
def PyExecReplace(line1,line2):
  r = vim.current.buffer.range(int(line1),int(line2))
  redirected = StringIO.StringIO()
  sys.stdout = redirected
  exec('\n'.join(r[:]) + '\n')
  sys.stdout = sys.__stdout__
  output = redirected.getvalue().split('\n')
  r[:] = output[:-1] # the -1 is to remove the final blank line
  redirected.close()
EOL
command! -range Pyer python PyExecReplace(<f-line1>,<f-line2>)
command! -range Pyx python PyExecReplace(<f-line1>,<f-line2>)


"" pymode settings
let g:pymode_lint = 0
"let g:pymode_lint_write = 0
"let g:pymode_utils_whitespaces = 0
"let g:pymode_breakpoint_cmd = "import pdb; pdb.set_trace() ### XXX BREAKPOINT"
"let g:pymode_breakpoint_key = "<Leader>B"
"let g:pymode_lint_ignore = "E127,W391,E501,E502,E231,E128,W291,W293,E251,E124,E255,E122,E121,E225,E261,E262,E126,E272,E302,E222"

""

let g:ctrlp_working_path_mode = '0'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""" Keybindings """"""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERD commenter
nmap  <Leader>xa           <Plug>NERDCommenterAltDelims
vmap  <Leader>xA           <Plug>NERDCommenterAppend
nmap  <Leader>xA           <Plug>NERDCommenterAppend
vmap  <Leader>x$           <Plug>NERDCommenterToEOL
nmap  <Leader>x$           <Plug>NERDCommenterToEOL
vmap  <Leader>xu           <Plug>NERDCommenterUncomment
nmap  <Leader>xu           <Plug>NERDCommenterUncomment
vmap  <Leader>xn           <Plug>NERDCommenterNest
nmap  <Leader>xn           <Plug>NERDCommenterNest
vmap  <Leader>xb           <Plug>NERDCommenterAlignBoth
nmap  <Leader>xb           <Plug>NERDCommenterAlignBoth
vmap  <Leader>xl           <Plug>NERDCommenterAlignLeft
nmap  <Leader>xl           <Plug>NERDCommenterAlignLeft
vmap  <Leader>xy           <Plug>NERDCommenterYank
nmap  <Leader>xy           <Plug>NERDCommenterYank
vmap  <Leader>xi           <Plug>NERDCommenterInvert
nmap  <Leader>xi           <Plug>NERDCommenterInvert
vmap  <Leader>xs           <Plug>NERDCommenterSexy
nmap  <Leader>xs           <Plug>NERDCommenterSexy
vmap  <Leader>xm           <Plug>NERDCommenterMinimal
nmap  <Leader>xm           <Plug>NERDCommenterMinimal
vmap  <Leader>x<Space>     <Plug>NERDCommenterToggle
nmap  <Leader>x<Space>     <Plug>NERDCommenterToggle
vmap  <Leader>xx           <Plug>NERDCommenterToggle
nmap  <Leader>xx           <Plug>NERDCommenterToggle
vmap  <Leader>x            <Plug>NERDCommenterToggle
nmap  <Leader>x            <Plug>NERDCommenterToggle
vmap  <Leader>xc           <Plug>NERDCommenterComment
nmap  <Leader>xc           <Plug>NERDCommenterComment

"Alternative <Leader> key
map , <Leader>

" Literal <Leader> character
inoremap <Leader><Leader> <Leader>

nnoremap <Space> :
vnoremap <Space> :

map go o<Esc>
map gO O<Esc>

"  In visual mode when you press * or # to search for the current selection
"vnoremap <silent> * :call VisualSearch('f')<CR>
"vnoremap <silent> # :call VisualSearch('b')<CR>

" Bindings for null register
noremap _ "_
noremap - "_
noremap zx "_
vnoremap _ "_
vnoremap - "_
vnoremap zx "_

noremap gr gT

noremap <silent> g^ :tabfirst<CR>
noremap <silent> g$ :tablast<CR>

map gb :bprevious!<CR>
map gn :bnext!<CR>
map <Leader>[ :bprevious!<CR>
map <Leader>] :bnext!<CR>
map <Leader>bb <C-^>

map <Leader>l :buffers<CR>
"map <Leader>k :FufBuffer<CR>
"map <Leader>K :FufFile<CR>

"map <silent> <Leader>m :MRU<CR>

map <Leader>t :tabnew<CR>
map <Leader>T :tab split<CR>

" Session saving
noremap gSd :mksession! ~/.vim/session_saved.vim<CR>
noremap gSr :source ~/.vim/session_saved.vim<CR>
noremap gSl :source ~/.vim/session_last.vim<CR>

" Error window handling
noremap gC :SyntasticCheck<CR>
noremap gV :SyntasticReset<CR>
noremap gc :lnext<CR>
noremap gv :Errors<CR>

map gB <Leader>be

" Insert mode exiting
imap fj <Esc>
inoremap <Leader>fj fj

inoremap <Esc> <Esc>`^

"inoremap <Leader><Tab> <Tab>
" Supertab addiotional mapping (due to snippets)
"inoremap qq<Tab> <C-n>
" pseudomap q<Tab> (code_copletion.vim plugin)

" Compiler
"map <F5> :SCCompileRun<CR>
"map <F6> :SCCompile<CR>
"map g<F5> :SCCompileRunAF <C-r>=expand(b:comp_flags)<Return><CR>
"map g<F6> :SCCompileAF <C-r>=expand(b:comp_flags)<Return><CR>
"map <Leader><F5> :SCCompileRunAF <C-r>=expand(b:comp_flags)<Return>
"map <Leader><F6> :SCCompileAF <C-r>=expand(b:comp_flags)<Return>

map <F9> :NERDTreeToggle<CR>
map <F11> :TlistToggle<CR>

map <F12> :set paste!<CR>:set paste?<CR>
imap <F12> <Esc>:set paste!<CR>:set paste?<CR>a
vmap <F12> :set paste!<CR>:set paste?<CR>
cmap <F12> :set paste!<CR>:set paste?<CR>

noremap <Backspace> :ZoomWin<CR>

