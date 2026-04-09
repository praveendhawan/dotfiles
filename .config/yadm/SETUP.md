# New Mac Setup

## 1. Install yadm
```bash
brew install yadm
```

## 2. Clone dotfiles
```bash
yadm clone https://github.com/praveendhawan/dotfiles
```

## 3. Install GPG
```bash
brew install gnupg
```

## 4. Import GPG key from Proton Pass
- Open Proton Pass → `GPG Key - dotfiles` (secure note)
- Copy private key content, paste into temp file

```bash
nano ~/gpg-private.asc
gpg --import ~/gpg-private.asc
gpg --edit-key YOUR_EMAIL
# inside gpg prompt: trust → 5 → quit
rm ~/gpg-private.asc
```

## 5. Decrypt SSH configs
```bash
yadm decrypt
```

## 6. Install brews
```bash
brew bundle install --file=~/.Brewfile
brew bundle install --file=~/.Brewfile.darwin
```

## 7. Reload shell
```bash
source ~/.zshrc
```

## 8. Set up VPN
- Install pass-cli and authenticate with Proton Pass
