" Coloring (use gruvbox)
syntax on
set background=dark


" Practice HJKL
map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>


" Set a map leader for more key combos
let mapleader = ','

" Some leader combos
" quick save
nmap <leader>, :w<cr>

" quick paste toggle
set pastetoggle=<leader>v

" quick edit vimrc
nnoremap <leader>ev :e! ~/.vimrc<cr>

" quick edit gitconfig
nnoremap <leader>eg :e! ~/.gitconfig<cr>

" quick edit zshrc
nnoremap <leader>ez :e! ~/.zshrc<cr>

" quick edit tmux config
nnoremap <leader>et :e! ~/.tmux.conf<cr>

" quick edit tmux config
nnoremap <leader>nt :NERDTreeToggle<cr>

" quick switch between buffers
nmap <leader>. <c-^>

" quick source .vimrc
nmap <leader>so :so ~/.vimrc<cr>


" Open new splits easily
map vv <C-W>v
map ss <C-W>s
" This will quit current buffer
map Q  <C-W>q


" Set correct path, for recursive vim-find
set path+=**


" Set encoding to utf-8 (required for vim-devicons)
set encoding=utf8


" Highlight cursorline in Insert Mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
autocmd vimenter * colorscheme gruvbox
" highlight CursorLine term=bold cterm=bold guibg=Gray40


" Lightline status bar
set laststatus=2


" Set fonts for vim-devicons
set guifont=DroidSansMono_Nerd_Font:h11


" Show tabline
set showtabline=2


" Set 85 chars marker
set colorcolumn=86


" Swap files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


" Open splits on the right and below
set splitbelow
set splitright


" Pair close braces
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>


" Keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv


" Rage quit Vim
nnoremap <esc><esc><esc><esc> :qa!<CR>


" Move between splits easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Move between buffers
nnoremap <tab>   :bn<cr>
nnoremap <S-tab> :bp<cr>


" UI config
set relativenumber
set number


" Load filetype-specific indent files
filetype indent on


" Complete longest common string, then each full match
set wildmode=longest,list


" Highlight matching brackets
set showmatch


" Searching
" Highlight words searched for
set hlsearch

" Search as characters are entered
set incsearch

" (Thankfully !) does exactly what it says
set ignorecase


" For the tabs <3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab


" Cursor shape
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


" For hiding buffers with edits
set hidden


" Fancy boi
set nocompatible


" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'itchyny/lightline.vim'

" Conquer of completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tim pope's Fugitive
Plug 'tpope/vim-fugitive'

" Nerd tree
Plug 'scrooloose/nerdtree'

" Go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Nerd tree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Lightline bufferline
Plug 'mengelbrecht/lightline-bufferline'

" Tim pope's commentary
Plug 'tpope/vim-commentary'

" Vim devicons
Plug 'ryanoasis/vim-devicons'

" gruvbox
Plug 'morhetz/gruvbox'

" gruvbox lightline
Plug 'shinchu/lightline-gruvbox.vim'

" Initialize plugin system
call plug#end()

let g:NERDTreeWinPos = "right"
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" let g:lightline = {'colorscheme': 'solarized'}
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

" Some script is overriding no-show mode, thus putting it at the end
set noshowmode

" Highlight matching brackets
set showmatch
