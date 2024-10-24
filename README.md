# dotfiles

a small bowl of rice

## my setup

- shell: bash
- window manager: hyprland
- bar: waybar
- launcher: rofi (wayland fork)
- terminal emulator: alacritty
- audio: pipewire
- network: nmcli
- browser: firefox
- file manager: yazi and thunar
- system monitor: bottom
- video: mpv
- text: astronvim
- aur helper: paru
- password manager: keepassxc
- bittorrent: qbittorrent
- images imv
- wallpaper setter: hyprpaper
- pdf: firefox
- color theme: catppuccin-mocha

## managing dotfiles

The management of these pesky files is done with bare git repo pointed at $HOME. 

### setup

```bash
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME' # add this to .bashrc
dotfiles config --local status.showUntrackedFiles no
```

### usage

```bash
dotfiles add <filepath> # or `dotfiles add -u` for just staging changed files
dotfiles commit -m "<message>"
```

### extras

for a new project

```bash
dotfiles add README.md LICENSE
dotfiles commit -m "add readme and license"
rm README.md LICENSE
dotfiles update-index --skip-worktree README.md LICENSE
```

updating the readme is now done through github

