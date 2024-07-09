#!/bin/bash

proot=$(pwd)
arch=$(uname -m)

# linux
if [[ $arch == x86_64* || $arch == aarch64 ]]; then
	sudo apt-get update && sudo apt-get upgrade -y
	sudo apt-get install -y python2 python3 golang
	sudo apt-get install -y tmux fzf npm clangd cmake
	sudo apt-get install -y python3-pip python3-venv libreadline-dev
# osx
elif [[ $arch == arm64 ]]; then
	brew install -y python3 go
	brew install -y tmux fzf npm llvm
	pip3 install virtualenv

	brew install -y neovim libreadline-dev
fi

# installation of neovim
# ubuntu
if [[ $arch == x86_64* ]]; then
	sudo apt install -y software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt update
	sudo apt install -y neovim
# linux arm 
elif [[ $arch == aarch64 ]]; then
	# we install neovim from public repo
	sudo apt install -y ninja-build gettext cmake unzip curl build-essential
	
	git clone https://github.com/neovim/neovim
	cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
fi

# install tpm for tmux
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# go back to root directory
cd "$proot"

mkdir -p ~/.config
cp -r .config/* ~/.config/
