"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load All my plugins!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.config/nvim/plug.vim
call plug#begin('~/.cache/nvim/plugged')

  " A great vim statusline with themes and git support
  Plug 'tpope/vim-fugitive'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Color
  Plug 'morhetz/gruvbox'  " Truecolor neovim support
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-colorscheme-switcher'

  " Add github gits plugin to save notes to plus ctrlp plugin
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  Plug 'mattn/ctrlp-gist'

  " Misc plugins
  Plug 'Shougo/deoplete.nvim'                   " Autocomplete
  Plug 'ntpeters/vim-better-whitespace'         " Highlight EOL whitespace
  "Plug 'ctrlpvim/ctrlp.vim'                     " Fast fuzzy find
  Plug 'junegunn/fzf'
  Plug 'jalvesaq/vimcmdline'                    " Run code from buffer

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clean, update, upgrade and install vim plugins from github; I like to run
" this on Mondays
command UpdatePlugins PlugUpgrade|PlugInstall|PlugUpdate|PlugClean|q|UpdateRemotePlugins

" Save document and run
command SaveAndRun w|!./%
map <C-r> :SaveAndRun<CR>

" Alwasy search $HOME with ctrp-p, but first must map ctrl-p to something else
let g:ctrlp_map = '<c-a>'
"map <C-p> :CtrlP ~<CR>
map <C-p> :FZF<CR>

" Set leader:
map , <Leader>

" Copy everything to the clipboard
command CopyToClipboard :%y+

" Format JSON
command FormatJson %!jq '.'

" Colorscheme switcher
map <F7> :PrevColorScheme<CR>
map <F8> :RandomColorScheme<CR>
map <F9> :NextColorScheme<CR>

" Enable <Tab> complete on sugestions, otherwise work normaly
inoremap <silent><expr> <Tab>  pumvisible() ? "<C-n>" : "<Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme stuff
color summerfruit
let g:airline_theme="light"

" Dont display welcome banner when opening without a fiel
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

" Write gist vim token to .local
let gist_token_file='~/.local/nvim/gist-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Post Gists as private by default
let g:gist_post_private = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load local settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.local/nvim/*.vim
