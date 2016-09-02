sudo apt-get install -y vim cscope ctags
sudo apt-get install -y build-essential  #gcc
sudo apt-get install -y gawk
sudo apt-get install -y git terminator unp tree
sudo apt-get install -y ncurses-dev # for GDB
sudo apt-get install -y meld # source code compare and merge tool
sudo apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev lib32ncurses5 x11proto-core-dev libx11-dev  lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc  lib32readline-gplv2-dev #  android compiling

sudo apt-get install -y default-jre default-jdk # java for android compiling

wget http://zlib.net/zlib-1.2.8.tar.gz

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

