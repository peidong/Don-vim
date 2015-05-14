vim settings
============
#This is my vim settings

You need to add This line

    git clone https://github.com/peidong/vimrc.git
    mv vimrc .vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer --omnisharp-completer --gocode-completer
