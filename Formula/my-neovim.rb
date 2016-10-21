class MyNeovim < Formula
  desc 'Install NeoVim with my setup'
  url 'https://github.com/Jeppesen-io/homebrew-macos/archive/master.zip'
  homepage 'https://github.com/Jeppesen-io/homebrew-neovim'
  version '0.5'

  depends_on 'neovim/neovim/neovim' => :HEAD
  depends_on 'curl'
  depends_on 'python3'

  bottle :unneeded

  def install
    # No action
  end

  def post_install

    # Copy over my configuration
    `mkdir -p ~/.config/nvim/`
    `cp -v dot-files/* ~/.config/nvim/`

    # Install vim-plug, a minimalist Vim plugin manager
    `curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

    # Link nvim to vim
    `ln -svf /usr/local/bin/nvim /usr/local/bin/vim`

    # Install latest neovom python3 bindings for deoplete plugin
    `pip3 install neovim --upgrade`

  end

end
