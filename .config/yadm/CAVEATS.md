# Caveats & Decisions

## yadm

- yadm uses a bare git repo at `~/.local/share/yadm/repo.git`
- Changes to encrypted files are NOT auto-tracked — always run manually:
```bash
  yadm encrypt
  yadm add ~/.local/share/yadm/archive
  yadm commit -m "Update SSH configs"
  yadm push
```
- Paths in `~/.config/yadm/encrypt` use relative paths (`.ssh/config` not `~/.ssh/config`)


## GPG

- `gnupg` ignores XDG spec — `~/.gnupg` is hardcoded, cannot move to `~/.config`
- Importing private key automatically imports public key — no separate export needed
- `gpg-agent` caches passphrase: 24h after last use, 7 days absolute max
- Private key stored in Proton Pass as **Start from scratch** secure note
- `export GPG_TTY=$(tty)` must be in `.zshrc` for pinentry to work in terminal

## SSH

- Private keys are stored in Proton Pass (SSH key item type) — NOT in yadm
- Only `~/.ssh/config` and `~/.ssh/configs/**` are in the yadm encrypted archive

## Brewfile

- Three files: `.Brewfile` (master), `.Brewfile.darwin`, `.Brewfile.linux`
- Only top-level intentional installs — no dependencies
- Audit with `brew leaves` periodically
- Always use `--no-vscode` flag when dumping:
```bash
  brew bundle dump --force --no-vscode --file=~/.Brewfile
```

## VPN (openfortivpn + ProtonPass)

- `openfortivpn` ignores SIGTERM — always use `kill -9`
- Spawns multiple processes per connection — `_vpn_pids_for_env` handles all PIDs
- All 3 envs run simultaneously in background
- Temp configs written to `/tmp/openfortivpn_${env}.conf`, cleaned up on disconnect
- Logs at `/tmp/vpn_${env}.log` — use `vpn_logs [env]` or `vpn_logs_follow [env]`

## yadm alternates

- `.jiffy-aliases##os.Darwin` — loaded only on macOS
- `.jiffy-aliases##os.Linux` — loaded only on Linux
- `.jiffy-aliases##distro.arch` — loaded only on Arch Linux
