#! /bin/bash

# Setup Auto connection from SSH Client to Server
# Run this script in Client

if [ $# -ne 2 ]; then
	echo "Usage $0 user ip"
	exit
fi

user=$1
ip=$2
set -x
if [ ! -e ~/.ssh/id_rsa.pub ]; then
	echo "------------------------------------"
	echo "id_rsa.pub NOT existed, generate it."
	echo "------------------------------------"
	cd ~/.ssh
	ssh-keygen -t rsa -f id_rsa -N ""
fi

ssh $user@$ip 'mkdir -p ~/.ssh'

cat ~/.ssh/id_rsa.pub | ssh $user@$ip 'cat >> .ssh/authorized_keys'

echo "Setup done, try \"ssh $user@$ip\""

