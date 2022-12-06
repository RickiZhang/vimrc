set nocompatible	"we dont want to mix up with vi

filetype plugin indent on "load file type according to detected filetype
syntax on "enable syntax highlighting

set autoindent
set expandtab
set softtabstop =4
set shiftwidth 	=4
set shiftround

set backspace	=indent,eol,start
set hidden
set laststatus	=2
set display		=lastline

set showmode
set showcmd

set incsearch
set hlsearch

set ttyfast
set lazyredraw

set splitright

set wrapscan
set report		=0
set synmaxcol	=200

set nu 
set showmatch 

set tabstop=4 

let g:mapleader=";"
set incsearch
set ignorecase
syntax enable
syntax on                  

set background=dark



call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'ericcurtin/CurtineIncSw.vim'  " switch between source and header
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " for fuzzy find
Plug 'Konfekt/FastFold' " for improved fold performance
Plug 'vim-scripts/gtags.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
call plug#end()

" key mapping for nerdtree
nnoremap <leader>l :NERDTreeFind<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists('s:std_in') | wincmd p | endif 
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" key mapping for YCM
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gs :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gh :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>

nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)

" key mapping for CurtineIncSw
nnoremap <leader>ko :call CurtineIncSw()<CR>

" key mapping for fzf
nnoremap <silent> <leader>f :FZF<CR>

" configuration of fastfold
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook=1
let g:fastfold_fold_command_suffixes = ['x', 'X', 'a', 'A', 'o', 'O', 'c', 'C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
autocmd FileType c,cpp setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent

" gtags configuration
let $GTAGSLABEL='native-pygments'
let $GTAGSCONF='/usr/local/share/gtags/gtags.conf'

map <C-n> :cn<CR>
map <C-p> :cp<CR>

" gutentags configuration
let g:cscopeprg = "gtags-cscope"
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_plus_switch = 1
let g:gutentags_define_advanced_commands = 1
"let g:gutentags_trace = 1
