" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Airline & Color Schemes
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" External Async Processes
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/libclang-python3'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'jpalardy/vim-slime'
Plug 'kassio/neoterm'
" Git & Projects
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
" Common Lisp
Plug 'l04m33/vlime', {'rtp': 'vim/'}
" C and C++
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Python
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'plytophogy/vim-virtualenv', { 'for': 'python' }
" Java & Kotlin
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
" SQL
Plug 'vim-scripts/dbext.vim', { 'for': 'sql' }
" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()

" GENERAL
set autoread
set nospell
set spelllang=en
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
set background=dark
" let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=0
colorscheme hybrid
let g:airline_theme='bubblegum'
let g:jellybeans_overrides={
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none'},
\}
autocmd BufRead,BufNewFile * syn match parens /[\[\]{}()]/ | hi parens ctermfg=darkgrey
hi MatchParen cterm=bold ctermbg=none ctermfg=white
" FZF colors
let g:fzf_colors =
  \ { 'fg':    ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" \ 'bg+':     ['bg', 'Ignore'],

" AIRLINE
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
let g:fzf_layout={'down': '~20%'}
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:ale_set_highlights=0

" COMMON LISP

" SQL
let g:dbext_default_profile='pg'
" let g:dbext_default_profile_name='type=PGSQL:user=:passwd=:dbname=:host='
so ~/.config/nvim/sql/dbextprofile.vim

" SLIME
let g:slime_target="neovim"
let g:slime_python_ipython=1

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
" Async run
nnoremap <leader>R :AsyncRun<space>
nnoremap <leader>t :AsyncRun pdflatex %<cr>
" Git
nnoremap <leader>m :Magit<cr>
nnoremap <leader>gg :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<space>
nnoremap <leader>ge :Gvsplit<space>
