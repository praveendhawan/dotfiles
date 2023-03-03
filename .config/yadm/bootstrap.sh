#!/bin/sh

# Symlink for fdfind
ln -s fdfind /usr/local/bin/fd

# Install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install ctree
git clone git@github.com:shkrt/component_tree.git
sudo cp -R component_tree/ /opt/
sudo chmod a+x /opt/component_tree/bin/ctree
export PATH="$PATH:/opt/component_tree/bin"
source ~/.zshrc

