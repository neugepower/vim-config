For a fresh installation simply follow these steps:

1. Remove/Backup ~/.vim: e.g. cp -R ~/.vim ~/vim-config-backup
2. Clone vim-config: git clone --recursive https://github.com/neugepower/vim-config.git .vim
3. Set link to vimrc: ln -s ~/.vim/.vimrc ~/.vimrc
4. Start vim and install plugins by running :PluginInstall while running vim
5. Setup plugins if necessary. Currently, some are deactivated but can be activated and vice-versa

Jedi, PEP8
    pip install jedi
    pip install pep8

JSHINT
    sudo apt-get install npm
    npm install -g jshint

TERN
    cd .vim/bundle/tern_for_vim
    npm install

Command-T
    cd ~/.vim/bundle/Command-T/ruby/command-t/
    ruby extconf.rb
    make

YouCompleteMe
    Please check the website!

Enjoy!
