#!/bin/bash

curpath=`pwd`
function update_package()
{
	source $curpath/packages_setup.sh
}

function update_bashrc()
{
	cp ~/.bashrc ~/.bashrc_backup
	sed -i "/cmd_env_setup\.sh/d" ~/.bashrc
	echo "source $curpath/cmd_env_setup.sh" >> ~/.bashrc
	source ~/.bashrc
}

function update_vim()
{
	cp -f ~/.vimrc ~/.vimrc_backup && rm -f ~/.vimrc
	cp -af ~/.vim ~/.vim_backup && rm -rf ~/.vim
	cp dot.vim/vimrc ~/.vimrc
	cp -a dot.vim/vim ~/.vim
}

for item in $@; do
	if [ $item == "bashrc" ]; then
		echo "update .bashrc"
		update_bashrc
	fi

	if [ $item == "package" ]; then
		echo "update packages"
		update_package
	fi

	if [ $item == "vim" ]; then
		echo "update vim"
		update_vim
	fi
done

