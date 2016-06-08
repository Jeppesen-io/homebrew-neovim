"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load All my plugins!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

so ~/.config/nvim/plug.vim
call plug#begin('~/.cache/nvim/plugged')

  " A great vim statusline with themes and git support
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'

  " Color
  Plug 'morhetz/gruvbox'  " Truecolor neovim support

  " Misc plugins
  Plug 'Shougo/deoplete.nvim'                   " Autocomplete
  Plug 'ntpeters/vim-better-whitespace'         " Highlight EOL whitespace

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clean, update, upgrade and install vim plugins from github; I like to run
" this on Mondays
command UpdatePlugins PlugInstall|PlugUpgrade|PlugUpdate|PlugClean|q|UpdateRemotePlugins

" Save document and run
command SaveAndRun w|!./%
map <C-r> :SaveAndRun<CR>

" Set leader:
map , <Leader>

" Copy everything to the clipboard
command CopyToClipboard :%y+

" Format JSON
command FormatJson %!jq '.'

" Enable <Tab> complete on sugestions, otherwise work normaly
inoremap <silent><expr> <Tab>  pumvisible() ? "<C-n>" : "<Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme stuff
color gruvbox
let g:gruvbox_contrast_light='hard'

"let g:airline_theme="light"

" Dont display welcome banner when opening without a file
set shortmess=I

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Show hiddenchars
set list

" Set EOL to unicode newline and set space/tab stuff
set listchars=tab:>-,trail:␣,extends:>,precedes:<

" Syntax highlighting
syntax enable

" Set tabs/spaces to white/grey
highlight SpecialKey ctermfg=2

" Display line numbers on the left
set number

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement and Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Speed up ctrlp search. Remove git and vendor dirs and hiddend dirs
let g:ctrlp_show_hidden = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/*,Library*,Downloads,Applications,Music,Documents

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep $home clean, use .local, .cache or .local for all files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Write viminfo to XDG .cache
set viminfo+=n~/.cache/nvim/viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load local settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.local/nvim/*.vim
