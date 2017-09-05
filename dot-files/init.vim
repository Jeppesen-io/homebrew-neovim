" Load my profile from github
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Download vim.plug if missing
if empty(glob('~/.cache/nvim/plug.vim'))
  echo 'vim-plug is missing. Downloading...'
  silent !curl --create-dirs -fLo ~/.cache/nvim/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo 'vim-plug downloaded. Run :PlugInstall to install plugins'
endif

so ~/.cache/nvim/plug.vim
call plug#begin('~/.cache/nvim/plugged')

  " All *MY* settings
  Plug 'jeppesen-io/homebrew-neovim'

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
:
