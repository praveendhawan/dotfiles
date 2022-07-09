#!/bin/bash

function swinstall {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    apt-get install $1 -y
  else
    echo "Already installed: ${1}"
  fi
}

function symlink {
  ln -s $(which $1) /usr/local/bin/fd
}

swinstall bat

swinstall fd-find
symlink fdfind fd

swinstall fzf

swinstall ripgrep
swinstall tmux
swinstall tree
swinstall universal-ctags
swinstall zsh
swinstall imagemagick
swinstall shared-mime-info

# install awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# install gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# install ctree
git clone git@github.com:shkrt/component_tree.git
sudo cp -R component_tree/ /opt/
sudo chmod a+x /opt/component_tree/bin/ctree
echo 'export PATH="$PATH:/opt/component_tree/bin"' >> ~/.bashrc
source ~/.bashrc

# install nvim
# # install fuse
sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y
# # download nvim lates
wget --quiet https://github.com/neovim/neovim/releases/latest/download/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin


# install packer for nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install ES
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch
sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch

