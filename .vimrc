autocmd! bufwritepost .vimrc source %

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mattn/zencoding-vim'
Bundle 'tpope/vim-surround'
Bundle 'klen/python-mode'
Bundle 'Shougo/neocomplcache'
Bundle 'osyo-manga/neocomplcache-clang_complete'
Bundle 'Rip-Rip/clang_complete'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomasr/molokai'
Bundle 'Auto-Pairs'
Bundle 'sudo.vim'
"Bundle 'a.vim'
"Bundle 'lrvick/Conque-Shell'
"Bundle 'Align'
"Bundle 'rails.vim'

filetype plugin indent on

set termencoding=utf-8
set fileencodings=utf-8,gb2312

set t_Co=256
set laststatus=2
set completeopt=menu

set pastetoggle=<F2>
set clipboard=unnamed

set mouse=a
set bs=2

set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233
highlight MatchParen ctermbg=None ctermfg=Red cterm=bold

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile


let mapleader = ","
nnoremap <leader>f :CtrlP<CR>

nnoremap <Leader>e :quit<CR>  " Quit current window
nnoremap <Leader>E :qa!<CR>   " Quit all windows

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap <Leader>n <esc>:tabprevious<CR>
nnoremap <Leader>m <esc>:tabnext<CR>

vnoremap < <gv
vnoremap > >gv

vmap Q gq
nmap Q gqap


autocmd FileType python highlight SpellBad ctermbg=None cterm=underline

autocmd FileType c,cpp imap <F9> <esc>:w<cr>:!clear && g++ "%:t" -o "%:t:r" && ./"%:t:r"<cr>
autocmd FileType c,cpp nmap <F9> :w<cr>:!clear && g++ "%:t" -o "%:t:r" && ./"%:t:r"<cr>
autocmd FileType c,cpp set cindent

autocmd FileType python imap <F9> <esc>:w<cr>:!clear && python "%:t"<cr>
autocmd FileType python nmap <F9> :w<cr>:!clear && python "%:t"<cr>

autocmd FileType ruby imap <F9> <esc>:w<cr>:!clear && ruby "%:t"<cr>
autocmd FileType ruby nmap <F9> :w<cr>:!clear && ruby "%:t"<cr>

autocmd FileType sh imap <F9> <esc>:w<cr>:!clear && ./"%:t"<cr>
autocmd FileType sh nmap <F9> :w<cr>:!clear && ./"%:t"<cr>


"CtrlP settings"
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*.class
let g:ctrlp_max_height = 30
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'r'


"python-mode settings"
nmap <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_lint_write = 0
nmap <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


"neocomplcache settings"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" add neocomplcache option
let g:neocomplcache_force_overwrite_completefunc=1
" add clang_complete option
let g:clang_complete_auto=1


"Rails settings"
"command -bar -nargs=1 OpenURL :!firefox <args>
