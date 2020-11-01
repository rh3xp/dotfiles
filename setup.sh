#!/bin/bash

HOME_DIR=$HOME
DOTFILE=$(pwd)

echo "Setting home directory to $HOME_DIR";
sleep 1

echo "Changing to the bash directory"
cd ${DOTFILE}/bash
bash_files=$(ls -A)
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${bash_files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILE}/bash/${file} ${HOME_DIR}/${file}
done


echo "Changing to the vim directory"
cd ${DOTFILE}/vim
vim_files=$(ls -A)
echo "...done"

for file in ${vim_files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILE}/vim/${file} ${HOME_DIR}/${file}
done

echo "Changing to the git directory"
cd $DOTFILE/git
git_files=".gitconfig .gitmessage.txt"
echo "...done"

for file in ${git_files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILE}/git/${file} ${HOME_DIR}/${file}
done

echo "Changing to the zsh directory"
cd $DOTFILE/zsh
zsh_files=".zshrc"
echo "...done"

for file in ${zsh_files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${DOTFILE}/zsh/${file} ${HOME_DIR}/${file}
done

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "...done"

echo "Cloning oh-my-zsh plugins repo"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "...done"

echo "Adding Wakatime configs"
#files=".wakatime.cfg"

cp ${DOTFILE}/.wakatime.cfg ~
