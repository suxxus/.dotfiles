syntax on
filetype plugin indent on

set showmode
set guicursor=
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set background=dark
set cursorline
set noshowmode 

" Set relative line numbers...
set relativenumber
" ...but absolute numbers on the current line (hybrid numbering)
set number
" Force the cursor onto a new line after 80 characters
set textwidth=80
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase
" Show matching words during a search.
set showmatch

" don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*
set wildignore+=**/__snapshots__/*
" Customise our current location information
set statusline=%f\ %=Line\ %l/%L\ Col\ %c\ (%p%%)
" Show status line
set laststatus=2
" Show file title in terminal tab
set title
" Show invisibles
set list
set listchars=tab:»-,trail:·


" plugins 
call plug#begin('~/.vim/plugged')

" airline 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim themes
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'wittyjudge/gruvbox-material.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Telescome
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" helpers
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

" development
Plug 'Pocco81/AutoSave.nvim'
Plug 'dense-analysis/ale' 
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'elmcast/elm-vim'

call plug#end()
" -----------------------------------
" let g:gruvbox_material_background = 'hard'
" let g:gruvbox_material_better_performance = 1
" let g:gruvbox_material_foreground = 'original'
" let g:gruvbox_material_transparent_background = 0
" let g:gruvbox_material_ui_contrast = 'high'
" let g:gruvbox_material_disable_terminal_colors = 1
" let g:gruvbox_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
colorscheme gruvbox-material

hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" -----------------------------------
" remap
let mapleader = " "
nnoremap <leader>ps <cmd>lua require('telescope.builtin').grep_string({search = vim.fn.input("Grep for > ")})<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" easier write
nnoremap <leader>w :w!<cr>
" easier quit
nnoremap <leader>q :q<cr>
" jump windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" resize window
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
"( This way you can insert a line under your cursor with <Leader>o and one on the previous line with <Leader>O.0
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" development
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = { 'javascript': ['prettier', 'eslint']}
let g:ale_linters = { 'elm': ['elm_ls'] }
let g:LanguageClient_servers = {
  \ 'elm': ['elm-language-server'],
  \ }
let g:elm_format_autosave = 1
let g:LanguageClient_rootMarkers = {
  \ 'elm': ['elm.json'],
  \ }

" config airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#enable#fugitive=1
let g:airline#enable#syntastic=1
let g:airline#enable#bufferline=1
let g:airline_theme='bubblegum'

" nerdcommenter settings
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
