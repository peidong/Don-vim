#!/usr/bin/env sh
# if [ "$(uname)" == "Darwin"  ]; then
#     # Do something under Mac OS X platform
# elif [ "$(expr substr $(uname -s) 1 5)" == "Linux"  ]; then
#     # Do something under GNU/Linux platform
# elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT"  ]; then
#     # Do something under Windows NT platform
# fi
cd ~
# mv .vim .vim_old
# mv .vimrc .vimrc_old
mv pei-vim .vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
# cp ~/.vim/vimrc.before.local ~/.vimrc.before.local
mkdir ~/.undodir/
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
./.vim/bundle/neobundle.vim/bin/neoinstall
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
