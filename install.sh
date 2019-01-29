#!/bin/bash
makeLink()
{
    if [ ! -e ~/$1 ]; then
        ln -s ~/dotfiles/$1 ~/$1
        echo "make $1"
    else
        echo "$1 is already exist"
    fi
}

makeDir()
{
    if [ ! -d ~/$1 ]; then
        mkdir ~/$1
        echo "make $1 dir"
    else
        echo "$1 is already exist"
    fi
}

echo "### make dotfile links ###"
makeLink .vimrc
makeLink .gvimrc
makeLink .zshrc
makeLink .gitconfig
makeLink .gitignore_global
makeLink .tmux.conf

touch ~/.gitconfig.local

echo "### make vim dirs ###"
#vim dir
makeDir .vimswap
makeDir .vimbackup
makeDir .vimundo

if [ $# -eq 0 ]; then
    echo "If you want install dein.vim, execution [./install.sh dein]"
    exit 
fi 

if [ $1 = "dein" ]; then
    echo "start dein install"
    makeDir .cache
    makeDir .cache/dein
    makeDir .vim
    makeDir .vim/dein

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein_installer.sh
    sh ./dein_installer.sh ~/.vim/dein
    rm dein_installer.sh
fi
