set exrc
set nocompatible

runtime macros/matchit.vim

set number

filetype off

"dein Scripts-----------------------------
" Required:
let g:dein_location = $HOME . '/.vim/./repos/github.com/Shougo/dein.vim'
let &runtimepath=&runtimepath . ',' . $HOME . '/.vim/./repos/github.com/Shougo/dein.vim'

" Required:
if dein#load_state($HOME . '/.vim/.')
  call dein#begin($HOME . '/.vim/.')

  " Let dein manage dein
  " Required:
  call dein#add($HOME . '/.vim/./repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('kien/ctrlp.vim')
  call dein#add('kien/rainbow_parentheses.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('Valloric/YouCompleteMe', {'build': './install.py'})
  call dein#add('majutsushi/tagbar')
  call dein#add('scrooloose/syntastic')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('scrooloose/nerdtree')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('Vimjas/vim-python-pep8-indent')
  call dein#add('lambdalisue/vim-cython-syntax')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

syntax on

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax python RainbowParenthesesLoadBraces

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

set splitright  " open splits on right side
set splitbelow

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
    if filereadable(expand("~/.fonts/DejaVu Sans Mono for Powerline.ttf"))
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
    else
        set guifont=Monospace\ 9
    endif
else
    colorscheme wombat256

    " setting console window title
    if exists('$VIRTUAL_ENV')
        let &titlestring = toupper(fnamemodify($VIRTUAL_ENV, ":t")) . " - VIM"
    else
        let &titlestring = "VIM"
    endif
    set title
endif

" for wombat colors
highlight ColorColumn ctermbg=235 guibg=#303030

set colorcolumn=80

if exists('g:nyaovim_version')
    let g:airline_powerline_fonts = 0  " poor support for nyaovim
else
    let g:airline_powerline_fonts = 1
endif

set wildmenu
set completeopt=longest,menu

set history=300
set autoread
set ruler

set tabpagemax=20 "Maximum number of on-start opened tabs

set undofile
set undodir=~/.vim/undos/

" Handler <ENTER> on completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:ycm_register_as_syntastic_checker = 1
let g:ycm_collect_identifiers_from_tags_files = 1

autocmd VimLeavePre * mksession! ~/.vim/session_last.vim

let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=E124,E127,W391,E501,E302,E225,E226,E228,E231,E261,E262,W291,W293,E203,E221,E303,E201,E202,E222,E126,E128,E251,W601'

let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


"""" Python specific

autocmd FileType python,cython,pyrex noremap <Leader>B Oimport pdb; pdb.set_trace()  ## XXX<Esc>
autocmd FileType python,cython,pyrex setlocal list listchars=trail:·,tab:·\ 
autocmd FileType python,cython,pyrex setlocal nosmartindent

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ]

""

let g:ctrlp_working_path_mode = '0'

let g:ycm_auto_trigger = 0

let g:tcommentMapLeaderOp1 = '<Leader>x'

" Helper function
function! GetVisualWord()
    return getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]
endfunction

function! HlText(text, word_only)
    if a:word_only
        let @/ = '\<' . a:text . '\>'
    else
        let @/ = a:text
    endif
    set hls
endfunction

function! HlWord(mode, word_only)
    if a:mode == 'v'
        let word = GetVisualWord()
    else
        let word = expand('<cword>')
    endif
    call HlText(word, a:word_only)
endfunction

function! AgTextSearch(text, ...)
    execute 'Ag' . ' ' . a:text . ' ' . join(a:000, ' ')
    echo join(a:000, ' ')
    call HlText(a:text, 0)
endfunction

command! -nargs=* AgS call AgTextSearch(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""" Keybindings """"""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TComment
nmap <Leader>xx <Leader>xc

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
map <F11> :TagbarToggle<CR>

map <F12> :set paste!<CR>:set paste?<CR>
imap <F12> <Esc>:set paste!<CR>:set paste?<CR>a
vmap <F12> :set paste!<CR>:set paste?<CR>
cmap <F12> :set paste!<CR>:set paste?<CR>

noremap <Leader>p :RainbowParenthesesToggle<CR>
noremap <Leader>g :YcmCompleter GoTo<CR>

" Highlighting and searching
nnoremap <Leader>/h :call HlWord('n', 1)<CR>
vnoremap <Leader>/h :call HlWord('v', 1)<CR>
nnoremap <Leader>/H :call HlWord('n', 0)<CR>
vnoremap <Leader>/H :call HlWord('v', 0)<CR>

noremap <Leader>n :nohl<CR>

nnoremap <silent> <Leader>/a :AgS <C-r>=expand('<cword>')<CR><CR>
nmap <Leader>// <Leader>/a
nnoremap <Leader>/A :AgS <C-r>=expand('<cword>')<CR> 

vnoremap <Leader>/a :<C-U>AgS <C-r>=GetVisualWord()<CR><CR>
vmap <Leader>// <Leader>/a
vnoremap <Leader>/A :<C-U>AgS <C-r>=GetVisualWord()<CR> 

nnoremap <Leader>pt :Pytest project<CR>


""" Usage notes
"
" To use Syntastic python code checking flake8 is required
" (preferably globally installed)
"
" py.test tests can be run with <Leader>pt, tests must reside
" in tests/ directory
"
" ag recursive search of selected word may be done with //
