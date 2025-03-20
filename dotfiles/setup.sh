#!/bin/bash

# dnf or apt
if command -v apt >/dev/null; then
    PKGMAN=apt
elif command -v dnf >/dev/null; then
    PKGMAN=dnf
fi

# install neovim
nvim -version
if [ $? -ne 0 ]; then
    $PKGMAN install -y tar git
    curl -OL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    tar -xzvf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
    mv nvim-linux-x86_64 /opt/nvim
    ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
    chmod -R 755 /opt/nvim
    chown -R root:root /opt/nvim
fi

# install deno if required
deno --version
if [ $? -ne 0 ]; then
    $PKGMAN install -y unzip
    curl -fsSL https://deno.land/install.sh | sh -s -- -y --no-modify-path
    mv ~/.deno /opt/deno
    ln -s /opt/deno/bin/deno /usr/local/bin/deno
    chmod +x /usr/local/bin/deno
fi

# neovim plugin setup
mkdir -p ~/.cache/dpp/repos/github.com/Shougo
cd ~/.cache/dpp/repos/github.com/Shougo
git clone https://github.com/Shougo/dpp.vim
git clone https://github.com/Shougo/dpp-protocol-git
git clone https://github.com/Shougo/dpp-ext-installer
git clone https://github.com/Shougo/dpp-ext-lazy
git clone https://github.com/Shougo/dpp-ext-toml

mkdir -p ~/.cache/dpp/repos/github.com/vim-denops
cd ~/.cache/dpp/repos/github.com/vim-denops
git clone https://github.com/vim-denops/denops.vim

# copy neovim settings
cp -r /app/config/ ~/.config

# neovim install and setting plugins
nvim --headless +"call dpp#async_ext_action('installer', 'install')" +qall
