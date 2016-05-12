cask 'neovim' do
  version '0.3'
  url 'https://github.com/Jeppesen-io/homebrew-bash/archive/master.zip'
  homepage 'https://github.com/Jeppesen-io/homebrew-bash'
  sha256 :no_check

  require 'fileutils'
  FileUtils::mkdir_p ENV['HOME'] + '/.config/nvim'
  FileUtils::mkdir_p ENV['HOME'] + '/.local/nvim'

  depends_on formula: 'neovim/neovim/neovim'
  depends_on formula: 'wget'
  depends_on formula: 'python3'

  artifact 'homebrew-neovom-master/dot-files', target: "#{ENV['HOME']}/.config/nvim"

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
