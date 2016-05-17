# vim

Most of this info is taken directly from:
http://vimcasts.org/episodes/synchronizing-plugins-with-git-
submodules-and-pathogen/

Install:

    cd ~
    git clone https://github.com/IG-89/vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc <-Symlink
    cd ~/.vim
    git submodule init
    git submodule update

Upgrading a plugin bundle:

    cd ~/.vim/bundle/example_plugin
    git pull origin master

Upgrading all bundled plugins:

    git submodule foreach git pull origin master

Remember to turn on the solarized scheme in the terminal preferences. 
