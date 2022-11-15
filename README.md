# dotfiles

Here lie my dotfiles. 

## my setup

- shell: alacritty
- window manager: leftwm
- bar: polybar
- terminal emulator: alacritty
- audio: pipewire
- network: nmcli
- browser: firefox
- file manager: thunar and ranger
- video: mpv
- ide: vscodium
- text: astronvim
- aur helper: paru
- password manager: keepassxc
- bittorrent: qbittorrent
- images: feh
- launcher: rofi
- compositor: picom
- pdf: zathura-mupdf
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
dotfiles add <filepath>
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

updating the readme

```bash
dotfiles update-index --no-skip-worktree README.md
dotfiles checkout -- README.md
...
dotfiles add README.md
dotfiles commit -m "update readme"
rm README.md
dotfiles update-index --skip-worktree README.md
```

