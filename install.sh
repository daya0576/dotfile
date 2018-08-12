#!/bin/bash

CONFIG_FILES=(
.bashrc
.tmux.conf
.vimrc
.ideavimrc
.zshrc
.ssh/config
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
