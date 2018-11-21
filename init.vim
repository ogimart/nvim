" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Airline & Color Schemes
Plug 'andreypopp/vim-colors-plain'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" External Async Processes
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'kassio/neoterm'
" Git & Projects
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
" Common Lisp
Plug 'kovisoft/slimv', {'for': 'lisp'}
" C and C++
Plug 'justmao945/vim-clang'
" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'plytophogy/vim-virtualenv', { 'for': 'python' }
" Java & Kotlin
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
" SQL
Plug 'vim-scripts/dbext.vim'
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()

" GENERAL
set autoread
set nospell
set spelllang=en
set clipboard=unnamed
nmap <cr> o<esc>k

" NO BACKUP
set noswapfile
set nobackup
set nowb

" TABS
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" INDENT
set autoindent
set copyindent
set smartindent

" NETRW
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1

" COLOR SCHEME
set termguicolors
set background=light
colorscheme plain
" autocmd BufRead,BufNewFile * syn match parens /[\[\]{}()]/ | hi parens ctermfg=darkgrey
" hi MatchParen cterm=bold ctermbg=none ctermfg=black

" AIRLINE
let g:airline_theme='sol'
set laststatus=2
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#ale#enabled=1

" ROOT DIR
let g:rooter_patterns=['project.clj', '.git/', 'build.gradle']
let g:rooter_resolve_links=1
let g:rooter_silent_chdir=1

" FZF & SEARCH
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:ale_set_highlights=0
let g:fzf_layout={'down': '~20%'}
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" COMMON LISP
let g:slimv_python_version=3
autocmd BufNewFile,BufRead *.asd set syntax=lisp

" PYTHON
" let g:python3_host_prog='~/.virtualenvs/nvim3/bin/python'

" SQL
let g:dbext_default_profile='pg'
" let g:dbext_default_profile_name='type=PGSQL:user=:passwd=:dbname=:host='
so ~/.config/nvim/sql/dbextprofile.vim
let g:sql_type_default = 'pgsql'
" let g:pgsql_pl = ["plpgsql" 'python']

" COMMENTS
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType java setlocal commentstring=//\ %s
autocmd FileType kotlin setlocal commentstring=//\ %s

" ASYNC RUN
augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup end

" PRETTY PRINT
command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %

" LEADER MAP
let mapleader="\<space>"
" Buffers
nnoremap <leader>e :Vexplore<cr>
nnoremap <leader>j :bprev<cr>
nnoremap <leader>k :bnext<cr>
nnoremap <leader>x :bprev\|bdel #<cr>
nnoremap <leader>d :bdel<cr>
" Search
nnoremap <leader>a :Ag<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>l :Lines<space>
nnoremap <leader>b :Buffers<cr>
" Git
nnoremap <leader>gm :Magit<cr>
nnoremap <leader>gg :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<space>
nnoremap <leader>ge :Gvsplit<space>
" Async run
nnoremap <leader>R :AsyncRun<space>
nnoremap <leader>L :terminal lein repl<cr>
nnoremap <leader>U :AsyncRun lein uberjar<cr>
nnoremap <leader>C :AsyncRun lein clean<cr>
nnoremap <leader>T :AsyncRun pdflatex %<cr>
nnoremap <leader>D :AsyncRun open -a "Marked 2" %<cr>
