" Load my profile from github
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.config/nvim/plug.vim
call plug#begin('~/.cache/nvim/plugged')

  " All *MY* settings
  Plug 'jeppesen-io/homebrew-neovim'

  " Syntax checking
  Plug 'vim-syntastic/syntastic'

  " Git plugin, used but airline
  Plug 'tpope/vim-fugitive'

  " A great vim statusline with themes and git support
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Great async autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Highlight EOL whitespace
  Plug 'ntpeters/vim-better-whitespace'

  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'

call plug#end()

