# README.md for .vimrc

See
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

Don't copy and paste this, since some of it is "example text."

Install on a new machine:

    cd ~
    git clone https://github.com/tjosc/vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

Installing a new plugin as a submodule:

    cd ~/.vim/bundle
    git submodule add http://github.com/ex_plugin /bundle/ex_plugin
    git add .
    git commit -m "Installed ex_plugin bundle as a submodule."

Upgrading a plugin bundle:

    cd ~/.vim/bundle/ex_plugin
    git pull origin master

Upgrading all bundled plugins:

    git submodule foreach git pull origin master

Initializing a new plugin bundle on a machine after an overall
update of ~/.vim/:

    cd ~/.vim/bundle/new_plugin
    git submodule init new_plugin
    git submodule update

Remember to turn on the solarized scheme in the terminal preferences if using
that colorscheme. 
