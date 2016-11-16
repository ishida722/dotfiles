#!/bin/bash
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#vim dir
mkdir ~/.vimswap
mkdir ~/.vimbackup
mkdir ~/.vimundo

#dein vim
mkdir ~/.cache/dein
mkdir ~/.vim
mkdir ~/.vim/dein

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
sh ./dein_installer.sh ~/.vim/dein
rm dein_installer.sh
