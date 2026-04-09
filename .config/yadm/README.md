# dotfiles

Personal dotfiles managed with [yadm](https://yadm.io) across machines.

## What's tracked

| File | Purpose |
|---|---|
| `.zshrc`, `.zshenv` | Shell config |
| `.aliases` | General aliases |
| `.e2e-aliases` | E2E project aliases |
| `.e2e-vpn` | VPN aliases (openfortivpn + ProtonPass) |
| `.jiffy-aliases##os.Darwin` | macOS-specific jiffy aliases |
| `.jiffy-aliases##os.Linux` | Linux-specific jiffy aliases |
| `.jiffy-aliases##distro.arch` | Arch-specific jiffy aliases |
| `.Brewfile` | Master brew packages |
| `.Brewfile.darwin` | macOS-specific brew packages |
| `.Brewfile.linux` | Linux-specific brew packages |
| `.config/nvim/` | Neovim config (Lua) |
| `.config/tmux/` | Tmux config |
| `.gnupg/gpg-agent.conf` | GPG agent cache settings |
| `.local/share/yadm/archive` | Encrypted SSH configs |

## SSH configs (encrypted)
- `~/.ssh/config`
- `~/.ssh/configs/**`

## New Mac setup
See `SETUP.md`

## Caveats & decisions
See `CAVEATS.md`
