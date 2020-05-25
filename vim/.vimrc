" Coloring
let term=$TERM
if term == "xterm"
    colorscheme evening            " syntax highlight theme
"elseif term == "xterm-256color"
"    colorscheme darkblue
else
    colorscheme solarized
endif
syntax on                          " show syntax color
set background=dark                " set background color


" Practice HJKL
map <Down> <NOP>
map <Up> <NOP>
map <Left> <NOP>
map <Right> <NOP>


" Don't show -- INSERT -- while in INSERT MODE
set noshowmode


" Key bindings
" Save using esc+esc
" nnoremap <Esc><Esc> :w<CR>


" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map Q  <C-W>q


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


" UI config
set relativenumber                 " show relative line numbers
set number                         " show absolute line number
filetype indent on                 " load filetype-specific indent files
set wildmode=longest,list          
set showmatch                      " highlight matching brackets
set colorcolumn=80                 " show the 80 chars boundary
" hi colorcolumn ctermbg=Grey40    " Color of the chars boundary
highlight ColorColumn term=bold cterm=bold guibg=lightgray


" Searching
set hlsearch                       " highlight words searched for
set incsearch                      " search as character are entered
set ignorecase                     " does exactly what it says


" For the tabs <3
set tabstop=4                      " set the default tabstop
set softtabstop=4                  " set no.of spaces in tab when editing
set shiftwidth=4                   " set the default shift width for indents
set expandtab                      " make tabs into spaces (set by tabstop)
set smarttab                       " smarter tab levels


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
set nocompatible                   " for fancy stuffs in vim


" Swap files
set backupdir=~/.vim/backup//      " Use this directory for backup
set directory=~/.vim/swap//        " Swap files out of project directory


" Vundle plugins
" set the runtime path to                                                          
" include Vundle and initialize                                                    
set rtp+=~/.vim/bundle/Vundle.vim                                                  
call vundle#begin()                                                                
                                                                                   
" alternatively, pass a path where                                                 
" Vundle should install plugins                                                    
" call vundle#begin('~/some/path/here')                                            
                                                                                   
" let Vundle manage Vundle, required                                               
Plugin 'tpope/vim-fugitive'                                                        
Plugin 'tpope/vim-commentary'                                                        
Plugin 'VundleVim/Vundle.vim'                                                      
" Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'                                                           
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}                    
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'                                                       
Plugin 'Xuyuanp/nerdtree-git-plugin'                                               
" Plugin 'lifepillar/vim-solarized8'

" VIM markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Plugin 'python/black'                               
                                                      
" add all your plugins here                           
" (note older versions of Vundle                      
" used Bundle instead of Plugin)                      
                                                      
" All of your Plugins must be added                   
" before the following line                           
call vundle#end()                  " required


" General mapping

" Set a map leader for more key combos
let mapleader = ','

" quick save
nmap <leader>, :w<cr>

" paste toggle
set pastetoggle=<leader>v

" quick edit vimrc
nnoremap <leader>ev :e! ~/.vimrc<cr>

" quick edit gitconfig
nnoremap <leader>eg :e! ~/.gitconfig<cr>

" quick switch between buffers
nmap <leader>. <c-^>

" quick source .vimrc
nmap <leader>so :so ~/.vimrc<cr>

" quick toggle nerdtree
nmap <leader>nt :NERDTreeToggle<cr>


" These are some hacky specific vim commands
let g:ycm_confirm_extra_conf = 0
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let vim_markdown_preview_github=1
let g:pymode_python = 'python3'
let g:vim_markdown_folding_disabled = 1
let g:NERDTreeWinPos = "right"
let g:ycm_global_ycm_extra_conf = "/home/aguha/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py"
" let g:lightline = {
"       \ 'colorscheme': 'solarized',
"       \ }

" Light line stuff
let g:lightline = {
  \   'colorscheme': 'solarized',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': '%3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }


autocmd BufRead,BufNewFile *.htm,*.js,*.php,*.html,*.yml,*.yaml,*.xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.cpp,*.hpp,*.c,*.cc,*.h,*.md setlocal colorcolumn=120
autocmd BufRead,BufNewFile *glmdp*,*nlnop*,mdp-*,nop-* setlocal syntax=yaml tabstop=2 shiftwidth=2 softtabstop=2

" Save session on quitting Vim
autocmd VimLeave * NERDTreeClose
" autocmd VimLeave * mksession! [filename]

" Highlight cursorline in Insert Mode
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
highlight CursorLine term=bold cterm=bold guibg=Gray40


" Don't show -- INSERT -- while in INSERT MODE
set noshowmode
set laststatus=2

" Only start NerdTree on Vim startup
" autocmd VimEnter * NERDTree

" I have commented these out, they highlight text that surpass
" the 80 chars limit. The coloring scheme is a bit annoying.
"
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/