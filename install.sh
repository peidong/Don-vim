#!/usr/bin/env sh
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
