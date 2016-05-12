cask 'neovim' do
  version '0.6'
  url 'https://github.com/Jeppesen-io/homebrew-neovim/archive/master.zip'
  homepage 'https://github.com/Jeppesen-io/homebrew-neovim'
  sha256 :no_check

  require 'fileutils'
  FileUtils::mkdir_p ENV['HOME'] + '/.config/nvim'
  FileUtils::mkdir_p ENV['HOME'] + '/.local/nvim'
  FileUtils::mkdir_p ENV['HOME'] + '/.cache/nvim'

  depends_on formula: 'neovim/neovim/neovim'
  depends_on formula: 'wget'
  depends_on formula: 'python3'

  artifact 'homebrew-neovim-master/dot-files/init.vim', target: "#{ENV['HOME']}/.config/nvim/init.vim"

postflight do

  `wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.config/nvim/plug.vim -q`

  # Vim local
  `touch ~/.local/nvim/local.vim`

  # Link nvim to vim
  `ln -svf /usr/local/bin/nvim /usr/local/bin/vim`

  # Install neovom python3 bindings for deoplete plugin
  `pip3 install neovim --upgrade`
end

end
