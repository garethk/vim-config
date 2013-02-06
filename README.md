vim-config
==========

my vim configuration stuff

Installation Instructions
===================

> apt-get install mercurial curl libtinfo-dev libncurses5-dev python-dev python3-dev exuberant-ctags libx11-dev libxt-dev libgtk2 libxtst-dev cmake

> \curl -L https://get.rvm.io | bash -s stable --rails

> hg clone https://vim.googlecode.com/hg/ vim

> ./configure --with-features=huge --with-x --enable-gui --enable-rubyinterp --enable-pythoninterp

> make

> sudo make install

> git clone git://github.com/garethk/vim-config .vim

> cd .vim

> ./init

YCM steps
==========

> cd ~

> mkdir ycm_temp

> cd ycm_temp

> curl -O http://llvm.org/releases/3.2/clang+llvm-3.2-x86_64-linux-ubuntu-12.04.tar.gz

> tar -zxvf clang+llvm-3.2-x86_64-linux-ubuntu-12.04.tar.gz

> cp clang+llvm-3.2-x86_64-linux-ubuntu-12.04/lib/libclang.so ~/.vim/bundle/YouCompleteMe/python

> cd ~

> mkdir ycm_build

> cd ycm_build

> cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_temp/clang+llvm-3.2-x86_64-linux-ubuntu-12.04 . ~/.vim/bundle/YouCompleteMe/cpp

> make ycm_core
