# Installation

1. `cp -R ~/.vim ~/vim-config-backup`
2. `git clone https://github.com/neugepower/vim-config.git .vim`
3. `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
4. `ln -s ~/.vim/vimrc ~/.vimrc`
5. Start vim and install plugins by running `:PlugInstall`
6. Some plugins need additional configuration/compilation (e.g. YouCompleteMe)
