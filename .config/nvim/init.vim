" vim:foldmethod=marker:foldlevel=0

" PLUGINS {{{
call plug#begin('~/.vim/plugged')

" basics
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'

" visual
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

" markdown
" Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'SidOfc/mkdx'
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 2 },
                        \ 'checkbox': { 'toggles': [' ', 'x'] } }

" " enable plasticboy's markdown frontmatter
" let g:vim_markdown_frontmatter = 1
" " allow following markdown links without the .md extension
" let g:vim_markdown_no_extensions_in_markdown = 1
" " autosave file when following markdown links
" let g:vim_markdown_autowrite = 1
" " open markdown links in splits
" let g:vim_markdown_edit_url_in = 'vsplit'
" " fold in python style
" let g:vim_markdown_folding_style_pythonic = 1

" syntax
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown']
" Plug 'pangloss/vim-javascript'
Plug 'dbeniamine/todo.txt-vim'
Plug 'jiangmiao/auto-pairs'
" enable flow syntax highlight
"let g:javascript_plugin_flow = 1

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" linting
Plug 'w0rp/ale'
let g:ale_lintes = {
\   'markdown': ['alex']
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier'],
\   'markdown': ['prettier'],
\}
let g:ale_fix_on_save = 1
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'editorconfig/editorconfig-vim'

" files
Plug 'mhinz/vim-startify'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'rg --files'
Plug 'mhinz/vim-startify'

" fzf note taking
Plug 'https://github.com/Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/Dropbox/Notes']
let g:nv_use_short_pathnames = 1

call plug#end()
" }}}
" SETTINGS {{{

filetype plugin indent on       " no idea
syntax on
runtime macros/matchit.vim      " hit '%' on if to jump to else

" various
set encoding=utf8               " Set UTF-8 encoding
set backspace=indent,eol,start  " Proper backspace behavior
set hidden                      " Possibility to have more than one unsaved buffers
set autoread                    " Reload files changed outside vim
set incsearch                   " Incremental search, hit CR to stop
set ignorecase                  " Ignore case when searching
set lazyredraw                  " Don't redraw during macros
set ruler                       " Shows the current line number at the bottom-right of the screen
set wildmenu                    " Great command-line completion, use `<Tab>` to move aet wraound and CR to validate
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.o,.git,tmp,node_modules,*.pyc
set backspace=indent,eol,start  " Allow backspace in insert mode
set noshowmode                  " Don't show current mode [bc Lightline]
set ttimeoutlen=1               " Exit insert/visual mode without ESC delay
set inccommand=split            " Highlight search results and show in preview split
" set conceallevel=2              " Conceals markdown syntax

" disable backups and swap
set nobackup
set nowb
set noswapfile

" theme
set termguicolors               " Use true colors for colorscheme
set background=dark             " Use dark scheme
colorscheme base16-default-dark " Set colorscheme

" text, tabs and indents
set expandtab                   " Tabs are spaces
set shiftwidth=4                " # of spaces to use for autoindent
set tabstop=4                   " # of spaces that a tab counts for
set softtabstop=4               " # of spaces in tab when editing
set linebreak                   " Wrap lines when convenient
set wrap                        " Wrap lines
set autoindent                  " Minimal automatic indenting for any filetype

" lines and numbers
set number                      " Show line number
set relativenumber              " Relative numbers are good
set numberwidth=6               " Wider linenumbers
set cursorline                  " Show line

" splits
set splitright                  " Splitting will put the new window right
set splitbelow                  " Splitting will put the new window below

" clipboard
set clipboard+=unnamedplus      " Always use system clipboard

" columns
set nojoinspaces                " Set 1 space btwn lines/periods to be joined

" scrolling
set scrolloff=999               " Working line will always be in the center

" undo
set undodir=$HOME/.vim/undodir  " Set persistent undodir path
set undofile                    " Write changes to the undofile
set undolevels=1000             " Max # of changes that can be undone
set undoreload=10000            " Max # of lines to save for undo on buf reload
set directory=$HOME/.vim/swp//  " Write swap files in one directory, unique nms
" }}}
" MAPPINGS {{{

" space as leader
let mapleader = "\<space>"
let maplocalleader = ","

" motion across wrapped lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" move to beginning/end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" move up/down half a screen
nnoremap J <C-d>
nnoremap K <C-u>

" use arrows to resize panes in normal mode
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" don't use arrows for movement in insert mode
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" highlight last inserted text
nnoremap gV `[v`]<Paste>

" disable Ex mode
nnoremap Q nop

" trim trailing whitespace
nnoremap <leader>w :%s/\s\+$//<CR>:noh<CR>

" turn off search highlight
nnoremap <leader>s :nohlsearch<CR>

" change/source config
nnoremap <leader>vr :sp $MYVIMRC<cr>
nnoremap <leader>so :source $MYVIMRC<cr>

" fzf mappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :Rg<CR>

" quick exit and save
inoremap jk <esc>
inoremap kj <esc>
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> <esc>:w<cr>

" split faster
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>

" easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap <A-Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" open/close folds
" nnoremap <Tab> za

" quick open notational notes
nnoremap <silent> <leader>n :NV<CR>

" jump betwee ALE warnings
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}
" FUNCTIONS {{{

" toggle wrap
function! ToggleWrap()
    if(&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunc

command! ToggleWrap call ToggleWrap()

" }}}
" AUGROUPS {{{

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init()
" augroup END

" }}}
