cask 'my-neovim' do

  version '1.0.4'
  url 'https://github.com/Jeppesen-io/homebrew-neovim/archive/master.zip'
  homepage 'https://github.com/Jeppesen-io/homebrew-neovim'
  sha256 :no_check

  artifact 'homebrew-neovim-master/dot-files/init.vim',   target: "#{ENV['HOME']}/.config/nvim/init.vim"

  depends_on formula: 'neovim'
  depends_on formula: 'curl'
  depends_on formula: 'python3'

  preflight do
    # Create xdg dirs for neovim
    `mkdir -vp #{ENV['HOME']}/.config/nvim`
    `mkdir -vp #{ENV['HOME']}/.cache/nvim`
    `mkdir -vp #{ENV['HOME']}/.local/nvim`

    `rm -f #{ENV['HOME']}/.config/nvim/init.vim`
  end

  postflight do

    `ln -svf /usr/local/bin/nvim /usr/local/bin/vim`

    `pip3 install neovim --upgrade`
  end

end
