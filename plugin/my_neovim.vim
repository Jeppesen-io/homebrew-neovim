" Load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.config/nvim/plug.vim
call plug#begin('~/.cache/nvim/plugged')

  " Git plugin, used but airline
  Plug 'tpope/vim-fugitive'

  " A great vim statusline with themes and git support
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Great async autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Highlight EOL whitespace
  Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clean, update, upgrade and install vim plugins from github; I like to run
" this on Mondays
command UpdatePlugins PlugUpgrade|PlugInstall|PlugUpdate|PlugClean|q|UpdateRemotePlugins

" Save document and run
command SaveAndRun w|!./%
map <C-r> :SaveAndRun<CR>

" Set leader:
map , <Leader>

" Copy everything to the clipboard
command CopyToClipboard :%y+

" Send open file to jq for linting
command FormatJson %!jq '.'

" Enable <Tab> complete on sugestions, otherwise work normaly
inoremap <silent><expr> <Tab>  pumvisible() ? "<C-n>" : "<Tab>"

" Switch between light and dark background with <Leader>bg
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable true color (as of NeoVim 0.1.5)
set termguicolors

" Dark is always the best
set background=dark

" Dont display welcome banner when opening without a file
set shortmess=I

" Enable powerline fonts
colorscheme slate
let g:airline_theme='papercolor'
let g:airline_powerline_fonts=1

" Display line numbers on the left
set number

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement and Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Force myself to not use arrow key
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>

" If you need to define a block in visual block mode with bounds outside the actual text
set virtualedit=block

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behavior deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Enable the use of the mouse and osx clipboard
set mouse=a
set clipboard=unnamed

" Enable deoplete (neovim autocomplete)
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep $home clean, use .local, .cache or .local for all files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Write viminfo to XDG .cache
set viminfo+=n~/.cache/nvim/viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load local settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" so ~/.local/nvim/*.vim
