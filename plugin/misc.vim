" Set leader:
map , <Leader>

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clean, update, upgrade and install vim plugins from github; I like to run
" this on Mondays
command! UpdatePlugins PlugUpgrade|PlugInstall|PlugUpdate|PlugClean|q|UpdateRemotePlugins

" Save document and run
command! SaveAndRun w|!./%
map <C-r> :SaveAndRun<CR>
" Copy everything to the clipboard
"
command! CopyToClipboard :%y+

" Lint!
command! LintJson %!jq '.'
command! LintYaml %!yq '.'

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

" Display line numbers on the left
set number

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=2
set softtabstop=2
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement and Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keep $home clean, use .local, .cache or .local for all files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Write viminfo to XDG .cache
set viminfo+=n~/.cache/nvim/viminfo

