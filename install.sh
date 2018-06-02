#!/bin/bash
set -ux

git submodule update --init --recursive

SCRIPT_DIR=$(cd $(dirname $0); pwd)

# install packages

packagelist=(
     "build-essential"
     "git"
     "vim"
     "ibus-mozc"
     "tmux"
     "fish"
)

echo "start apt-get install apps..."
for list in ${packagelist[@]}; do
    sudo apt-get install -y ${list}
done

sudo apt-get update
sudo apt-get upgrade

# fish
mkdir -p ~/.config/fish/functions
ln -s ${SCRIPT_DIR}/fish_prompt.fish ~/.config/fish/functions 
ln -s ${SCRIPT_DIR}/informative_git_prompt/__informative_git_prompt.fish ~/.config/fish/functions 

# git
ln -s ${SCRIPT_DIR}/.gitconfig ~/.gitconfig 

# vim
ln -s ${SCRIPT_DIR}/.vimrc ~/.vimrc

# tmux
ln -s ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf

# bash
echo "-------my setting--------" >> ~/.bashrc
echo "export $SCRIPT_DIR/.bashrc" >> ~/.bashrc
