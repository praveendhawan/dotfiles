#!/bin/bash

# Install zsh
# fontconfig-> for fc-list and
# base-devel for brew
sudo pacman -Syu --noconfirm zsh fontconfig base-devel
# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install utility tools
sudo pacman -Syu bat eza lnav jq procs fd fzf ncdu ripgrep tree wget tealdeer tree-sitter neovim starship

# Install yay (Just like brew)
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd .. && rm -rf yay

yay aws-cli-v2-bin

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

. "$HOME/.asdf/asdf.sh"

# Install nerd fonts
if fc-list | grep -i "FiraMono" >/dev/null 2>&1; then
  echo "FiraMono is already installed"
else
  echo "Installing FiraMono"
  sudo pacman -Syu otf-firamono-nerd
fi

# Install Nodejs
asdf plugin add nodejs
asdf install nodejs 20.5.0
asdf global nodejs 20.5.0

# Install Ruby
asdf plugin add ruby
asdf install ruby 2.7.6
asdf global ruby 2.7.6

# Set zsh as default shell for praveen user
sudo chsh -s /bin/zsh praveen

# Setup aws-cli
aws configure

# Setup Jiffy repo
if [ -d "/home/praveen/jiffyshirts" ]; then
else
  git clone git@github.com:sdtechdev/spree-jiffyshirts.git /home/praveen/jiffyshirts

  cd /home/praveen/jiffyshirts
  touch config/application.yml
  # Set permissions for development directory (adjust as needed)
  chown -R praveen:praveen /home/praveen/jiffyshirts
fi
