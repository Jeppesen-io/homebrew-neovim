class MyNeovim < Formula
  desc 'Install Neovim how I like it'
  url 'https://github.com/Jeppesen-io/homebrew-neovim/archive/master.zip'
  homepage 'https://github.com/Jeppesen-io/homebrew-neovim'
  version '1.1.3'

  depends_on 'neovim/neovim/neovim'
  depends_on 'curl'
  depends_on 'python3'

  bottle :unneeded

  def install

    # Get home dir (stripped by homebrew)
    home_dir = `sudo -Hu $USER bash -c 'echo -n $HOME'`

    # Create xdg dirs for neovim
    system 'mkdir', '-vp', "#{home_dir}/.config/nvim/"
    system 'mkdir', '-vp', "#{home_dir}/.cache/nvim/"
    system 'mkdir', '-vp', "#{home_dir}/.local/nvim/"

    # Copy over my configuration
    system 'cp', '-v', './dot-files/init.vim'	, "#{prefix}"
    system 'ln', '-svf', "#{prefix}/init.vim"	, "#{home_dir}/.config/nvim/init.vim"

    # Install vim-plug, a minimalist Vim plugin manager
    system 'curl', '-fLo', "#{prefix}/plug.vim", 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    system 'ln', '-svf', "#{prefix}/plug.vim", "#{home_dir}/.config/nvim/plug.vim"

    # Link nvim to vim
    system 'ln', '-svf', '/usr/local/bin/nvim', '/usr/local/bin/vim'

    # Install latest neovom python3 bindings for deoplete plugin
    system 'pip3', 'install', 'neovim', '--upgrade'

  end

end
