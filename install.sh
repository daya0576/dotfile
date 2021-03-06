#!/bin/bash

CONFIG_FILES=(
  .bashrc
  .tmux.conf
  .tmux-osx.conf
  .vimrc
  .ideavimrc
  .zshrc
  .ssh/config
  pipx.list
  init.vim
)
MY_RC_PATH=$(pwd)
echo "Current path: $MY_RC_PATH"
echo


for file in ${CONFIG_FILES[@]}
do
  if [ -f ~/${file} ]
  then
          echo "${file} already exist!"
          mv ~/${file} ~/old_rcfiles
  elif [ -h ~/${file} ]
  then
          echo "${file} is soft link, move to old_rcfiles"
          mv ~/${file} ~/old_rcfiles
  else
          echo "${file} doesn't exist!"
  fi
  ln -s $MY_RC_PATH/${file} ~/${file}
	echo "ln -s $MY_RC_PATH/${file} ~/${file}"
	echo
done

#### install zsh plugins
# cp -r zsh/plugins/z.lua/  $ZSH_CUSTOM/plugins/z.lua
# cp -r zsh/plugins/zsh-syntax-highlighting  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

#### install vim plug manager
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#### install vim colors
mkdir -p ~/repo/private/daya_dotfiles && ln -s $MY_RC_PATH/vim/colors/Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
