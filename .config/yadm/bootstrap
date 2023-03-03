#!/bin/bash

# Check if fd symlink already exists before creating
if [ ! -L /usr/local/bin/fd ]; then
  ln -s "$(which fdfind)" /usr/local/bin/fd
fi

# Check if AWS CLI v2 is already installed before attempting to install
if ! command -v aws &> /dev/null; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
fi

# Check if ctree is already installed before attempting to install
if [ ! -d /opt/component_tree ]; then
  git clone git@github.com:shkrt/component_tree.git
  sudo cp -R component_tree/ /opt/
  sudo chmod a+x /opt/component_tree/bin/ctree
  export PATH="$PATH:/opt/component_tree/bin"
fi
