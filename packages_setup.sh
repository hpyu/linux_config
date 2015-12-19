si vim
si build-essential #gcc 
si gawk
si git terminator unp tree
si ncurses-dev # for GDB
si meld # source code compare and merge tool
si git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev lib32ncurses5 x11proto-core-dev libx11-dev  lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc  lib32readline-gplv2-dev #  android compiling

si default-jre default-jdk # java for android compiling

function ins_gcc5 ()
{
	sudo add-apt-repository ppa:ubuntu-toolchain-r/test 
	sudo apt-get update
	sudo apt-get install g++-5
	cd /usr/bin/
	sudo rm gcc g++
	sudo ln -s g++-5 g++
	sudo ln -s gcc-5 gcc
}

