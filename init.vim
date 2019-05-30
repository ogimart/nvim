" nvim +'silent! colorscheme' +'PlugInstall --sync' +qa
" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Search
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" Airline & Color Schemes
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
" External Async Processes
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'jpalardy/vim-slime'
" Git & Projects
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
" Common Lisp
Plug 'kovisoft/slimv', {'for': 'lisp'}
" Clojure (JVM)
Plug 'tpope/vim-fireplace', {'for': 'clojure'}
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
" C++
Plug 'Shougo/deoplete-clangx', {'for': 'cpp'}
Plug 'Shougo/neoinclude.vim' , {'for': 'cpp'}
Plug 'vhdirk/vim-cmake' , {'for': 'cpp'}
" Go
Plug 'fatih/vim-go', {'for': 'go' }
Plug 'zchee/deoplete-go', {'for': 'go'}
" Python
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
" SQL
Plug 'vim-scripts/dbext.vim', {'for': 'sql'}
Plug 'lifepillar/pgsql.vim', {'for': 'sql'}
" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
call plug#end()

" NEOVIM
let g:python3_host_prog=expand('~/.pyenv/versions/nvim3/bin/python')
let g:python_host_prog=expand('~/.pyenv/versions/nvim2/bin/python')

" GENERAL
set autoread
set nospell
set spelllang=en
set clipboard=unnamed
set signcolumn=yes

" NO BACKUP
set noswapfile
set nobackup
set nowb

" TABS
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
autocmd FileType c setlocal shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal shiftwidth=4 softtabstop=4
autocmd FileType go setlocal tabstop=4 shiftwidth=4
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" INDENT
set autoindent
set copyindent
set smartindent

" NETRW
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1
autocmd FileType netrw setlocal signcolumn=no

" COLOR SCHEME
set termguicolors
set background=dark
colorscheme jellybeans
hi normal guibg='none'
hi signcolumn guibg='none'
hi clojureParen guifg='#BBBBBB'

" vertical split
set fillchars+=vert:│
hi vertsplit guifg=#4c566a guibg=none

" AIRLINE
set noshowmode
let g:airline_theme='jellybeans'
set laststatus=2
let g:airline_powerline_fonts=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#checks =
  \['indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts']

" ROOT DIR
let g:rooter_patterns=['project.clj', '.git/', 'build.gradle']
let g:rooter_resolve_links=1
let g:rooter_silent_chdir=1

" FZF & SEARCH
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
let g:fzf_layout={'down': '~20%'}
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" ASYNC RUN
augroup vimrc
  autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup end

" SLIME
let g:slime_target="neovim"
let g:slime_python_ipython=1
" let g:slime_dont_ask_default=1

function! SlimeTerminal(cmd)
    vsplit
    execute 'normal!' . "\<c-w>p"
    enew | call termopen(a:cmd)
    let l:repl_job_id = b:terminal_job_id
    execute 'normal!' . "\<c-w>p"
    let b:slime_config = {'jobid': l:repl_job_id}
endfunction

" COMPLETION
let g:deoplete#enable_at_startup=1
let g:UltiSnipsExpandTrigger="<tab>"

" ALE
let g:ale_sign_column_always=1
let g:ale_completion_enabled=0
let g:ale_lint_on_enter=0
let g:ale_lint_on_text_changed='normal'

" COMMON LISP
let g:slimv_python_version=3
let g:slimv_repl_split=4
autocmd BufNewFile,BufRead *.asd set filetype=lisp

" CLOJURE
command! CljReplTerminal call SlimeTerminal("clojure")
command! LeinReplTerminal call SlimeTerminal("lein repl")

" PYTHON
let g:jedi#completions_enabled=0
let g:jedi#rename_command="<leader>r"
command! Flake8 :AsyncRun /usr/local/bin/flake8
command! IPythonTerminal call SlimeTerminal("ipython --colors linux")
command! SchemeTerminal call SlimeTerminal("scheme")

" GO
let g:go_highlight_types=1

" JAVA
" autocmd FileType java setlocal omnifunc=javacomplete#Complete

" SQL
let g:dbext_default_profile='pg'
" let g:dbext_default_profile_name='type=PGSQL:user=:passwd=:dbname=:host='
let g:dbext_default_history_file =
  \'~./local/share/nvim/dbext/dbext_sql_history.txt'
so ~/.local/share/nvim/dbext/profile.vim
let g:sql_type_default = 'pgsql'

" PROLOG
command! SWIReplTerminal call SlimeTerminal("swipl")

" PRETTY PRINT
command! PrettyPrintJSON %!python -m json.tool
command! PrettyPrintHTML !tidy -mi -html -wrap 0 %
command! PrettyPrintXML !tidy -mi -xml -wrap 0 %

" COMMENTS
autocmd FileType asd setlocal commentstring=;\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cc setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s
autocmd FileType java setlocal commentstring=//\ %s

" LEADER MAP
let mapleader="\<space>"
" Editing
nnoremap <leader>] o<esc>k
nnoremap <leader>[ O<esc>j
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
nnoremap <leader>gg :Git<space>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<space>
nnoremap <leader>ge :Gvsplit<space>
" Async run
nnoremap <leader>R :AsyncRun<space>
nnoremap <leader>I :terminal ipython --colors linux<cr>
nnoremap <leader>L :terminal lein repl<cr>
nnoremap <leader>U :AsyncRun lein uberjar<cr>
nnoremap <leader>C :AsyncRun lein clean<cr>
nnoremap <leader>S :SlimeTerminal scheme<cr>
nnoremap <leader>T :AsyncRun pdflatex %<cr>
nnoremap <leader>D :AsyncRun open -a "Marked 2" %<cr>
" Terminal
" tnoremap <Esc> <C-\><C-n>:q!<CR>
