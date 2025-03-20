#!/bin/bash

function npmInstall() {
    if [ $(npm list -g | grep $1 | wc -l) -ne 1 ]; then
        sudo npm install -g $1
    fi
}

if [ ! -d $HOME/.config/nvim ]; then
    mkdir -p $HOME/.config/nvim
fi

if [ ! -d "$HOME/.config/nvim/dein.vim" ]; then
    git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/dein.vim
fi

curl -V
if [ $? -ne 0 ]; then
    echo "curl is not installed!"
    echo "sudo dnf install curl -y"
    return 1
fi

node --version
if [ $? -ne 0 ]; then
    curl -fsSL https://rpm.nodesource.com/setup_22.x | sudo bash -
    sudo dnf install nodejs -y
fi
npmInstall 'pyright'
npmInstall 'bash-language-server'
npmInstall 'vscode-langservers-extracted'

java --version 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    sudo dnf install java-21-openjdk-devel java-21-openjdk -y
fi
if [ ! -d $HOME/.config/nvim/lsp/java ]; then
    CUR_DIR=$(pwd)
    mkdir -p $HOME/.config/nvim/lsp/java
    cd $HOME/.config/nvim/lsp/java
    wget https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
    tar -xzvf jdt-language-server-latest.tar.gz
    rm jdt-language-server-latest.tar.gz
    cd $CUR_DIR
    mkdir -p ~/eclipse-workspace/
fi


cp init.lua $HOME/.config/nvim/
cp lua/ $HOME/.config/nvim/ -rf
