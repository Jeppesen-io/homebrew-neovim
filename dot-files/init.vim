" Load my profile from github
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
so ~/.config/nvim/plug.vim
call plug#begin('~/.cache/nvim/plugged')

  " Load plugins
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Git plugin, used but airline
  Plug 'tpope/vim-fugitive'

  " A great vim statusline with themes and git support
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Great async autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Highlight EOL whitespace
  Plug 'ntpeters/vim-better-whitespace'

  " After all, that configure it up
  Plug 'jeppesen-io/homebrew-neovim'

call plug#end()

