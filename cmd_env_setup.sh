#!/bin/bash

alias si='sudo apt-get install '
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'
alias cd6='cd ../../../../../..'
alias cs='ctags -L cscope.files && cscope -bkq -i cscope.files'
alias fgc="find . -name "*.c" | xargs grep -rn "
alias fgh="find . -name "*.h" | xargs grep -rn "
alias fgs="find . -name "*.s" | xargs grep -rn "
alias cmd="terminator -l mylayout"
alias d='objdump -d -M intel '

export PATH=$PATH:~/bin:~/kernel/scripts
export USE_CCACHE=1
export CCACHE_DIR=$HOME/ccache

alias ls='ls --color'
LS_COLORS='rs=0:di=01;36:ln=04;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
export LS_COLORS

function make_tag()
{
	find . -type f -name "*.[c|h|s|S]" -o -name "*.cpp" > cscope.files
	ctags -L cscope.files && cscope -bkq -i cscope.files
}

function fsrc()
{
#	echo 'time find . -name "*.[c|s|S|h|o]" -o -name "*.cpp" -o  -name "*.mk" -o -name "*.java"  -o -name "*.sh"'

	if [ $# -lt 1 ]; then
		find . \( -name "*.[c|s|S|h]" -o -name "*.cpp" -o  -name "*.mk" -o -name "*.java"  -o -name "*.sh" \)  -exec ls $PWD/{} \;
	else
		for dir in $*
		do
			find $dir \( -name "*.[c|s|S|h]" -o -name "*.cpp" -o  -name "*.mk" -o -name "*.java"  -o -name "*.sh" \)  -exec ls $PWD/{} \;
		done
	fi
}

function f()
{
	if [ $# -lt 1 ];then
		echo "Usage f pattern"
		return -1
	fi
	find . -name ".git" -prune -o -name "*$1*" -print
}

function g()
{
	if [ $# -lt 2 ];then
		echo "Usage g pattern dirpath"
		return -1
	fi
	grep -rn "$1" $2 --exclude-dir=.git --exclude-dir=.repo --exclude=tags --exclude=cscope*
}

function push()
{
	if [ $# -lt 1 ];then
		echo "Usage push xxx.sh"
	fi
	adb root
	adb push $1 /data/
	adb shell chmod 777 /data/$1
}

function alog_kmsg()
{
	grep " KERNEL  " $1  | cut -b44-
}

function screen_attach()
{
	session_process=$(screen -ls | awk 'NR==2 {print $1}')
	screen -r $session_process
}

function dis_func_x86()
{
	if [ $# -lt 2 ]; then
		echo "Usage: dis_func_x86 obj func_name"
		return -1
	fi

	obj=$1
	func_name=$2

	objdump -d -M intel $obj | grep -A 1000 "<$func_name>:" | sed -e '/^$/,$d'
}

