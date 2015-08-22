install:
	git submodule update --init --recursive --rebase
	ln -s ~/.vim/vimrc ~/.vimrc
	cd bundle/vimproc && make

update:
	git submodule sync
	git submodule update --init --recursive --rebase
	cd bundle/vimproc && make
