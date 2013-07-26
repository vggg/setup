#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

# install node js and npm
sudo apt-get install -y nodejs npm

# install cheerio commander
sudo npm install express
sudo npm install commander
sudo npm install cheerio

#install heroku toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# ins tall screen
cd $HOME
wget raw.github.com/startup-class/dotfiles/master/.screenrc -O .screenrc
head .screenrc

echo "---------------------------------------------------------"
echo '    git config --global user.name "Your Name"'
echo "   git config --global user.email you@example.com"
echo "---------------------------------------------------------"
echo "cd $HOME"
echo "ssh-keygen -t rsa -C 'email@address.com'"
echo "cat .ssh/id_rsa.pub"
echo "copy key and add ssh key to https://github.com/setting/ssh"
echo "ssh -T git@github.com"

echo "---------------------------------------------------------"
sudo npm install -g n"
sudo n stable"

echo "---------------------------------------------------------"
echo "heroku login"
echo "ssh-keygen -t rsa"
echo "heroku keys:add"
