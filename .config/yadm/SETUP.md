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

## 7. Run bootstrap
Runs every script in `~/.config/yadm/bootstrap.d/`: the macOS setup (`bootstrap`), then
`sofaktry` (clones the factory repo and links `factory` into `~/.local/bin`). Needs the SSH
keys from step 5 for the private repo.
```bash
yadm bootstrap
```

## 8. Reload shell
```bash
source ~/.zshrc
```

## 9. Set up VPN
- Install pass-cli and authenticate with Proton Pass
