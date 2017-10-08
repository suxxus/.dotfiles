set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required    
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'ruanyl/vim-fixmyjs'
Plugin 'djoshea/vim-autoread'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set autoindent
set ts=4
filetype on

syntax on
set ignorecase
set smartcase
set hlsearch
set modelines=0
set wildmenu
set wildmode=longest:full
set nu "line numbers

"for indenting
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
vmap <Tab> >gv
vmap <S-Tab> <gv
inoremap <S-Tab> <C-D>

set lbr "word wrap
set tw=500

set wrap "Wrap lines

" scrolling
inoremap <C-E> <C-X><C-E> "scrolling on insert
inoremap <C-Y> <C-X><C-Y>
set scrolloff=3 " keep three lines between the cursor and the edge of the screen

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " " " Leader is the space key
let g:mapleader = " "
"auto indent for brackets
inoremap {V5<CR> {<CR>}y7<Esc>O
" easier write
nmap <leader>w :w!<cr>
" easier quit
nmap <leader>q :q<cr>
" silence search highlighting
nnoremap <leader>sh :nohlsearch<Bar>:echo<CR>
"paste from outside buffer
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
"copy to outside buffer
vnoremap <leader>y "+y
"select all
nnoremap <leader>a ggVG
"paste from 0 register
"Useful because `d` overwrites the <quote> register
nnoremap <leader>P "0p
vnoremap <leader>P "0p

nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>

"nnoremap tj  :tabnext<CR>

set mouse=a

" move in long lines
nnoremap k gk
nnoremap j gj

" vimslime
"let g:slime_target = "tmux"
"nmap <C-C><C-N> :set ft=haskell.script<CR><C-C><C-C>:set ft=haskell<CR>

" pathogen
execute pathogen#infect()

" persistent undo
if !isdirectory($HOME."/.dotfiles/vim/undodir")
    call mkdir($HOME."/.dotfiles/vim/undodir", "p")
endif

set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown

" fzf command
set rtp+=~/.fzf

nnoremap <leader>t :call fzf#run({ 'sink': 'tabe', 'options': '-m +c', 'dir': '.', 'source': 'find .' })<CR>

" ctags looks in the right directory
set tags=./.tags,.tags;$HOME
nnoremap <C-}G g<C-]>
nnoremap <C-[> <C-t>


" Run python when typing <leader>r
noremap <buffer> <leader>r :w<cr> :exec '!python' shellescape(@%, 1)<cr>

"ycm
"let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0 " Don't ask for confirmation about ycm_extra_conf
"
" From http://stackoverflow.com/questions/3105307/how-do-you-automatically-remove-the-preview-window-after-autocompletion-in-vim
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Red coloring at whitespace after end of line whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red


" #################
" USER CONFIG
" #################  
let mapleader=","

set t_Co=256
syntax on
set background=dark
colorscheme distinguished

" nerdcomment
set timeout timeoutlen=1500

" YouComplete
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug' 

" insert new line without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" autoreload
" set autoread

" swp files
set directory^=$HOME/.vim/.tmp//

" ---------------------------------------------------------------------------
"  borrowed from https://github.com/csswizardry/dotfiles/blob/master/.vimrc
" ---------------------------------------------------------------------------

" NERDTree
" Run NERDTree as soon as we launch Vim...
autocmd vimenter * NERDTree
" ...but focus on the file itself, rather than NERDTree
autocmd VimEnter * wincmd p
" Close Vim if only NERDTree is left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Visual decorations
" Show status line
set laststatus=2
" Show what mode you’re currently in
" set showmode
" Show what commands you’re typing
" set showcmd
" Allow modelines
" set modeline
" Show current line and column position in file
set ruler
" Customise our current location information
set statusline=%f\ %=Line\ %l/%L\ Col\ %c\ (%p%%)
" Show file title in terminal tab
set title
" Show invisibles
set list
set listchars=tab:»-,trail:·
" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number
" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
" Colour the column just after our line limit so that we don’t type over it
set colorcolumn=+1
" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51
" Highlight current line
set cursorline


" Search

" Don’t keep results highlighted after searching...
" set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase
