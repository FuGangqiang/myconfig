#!/bin/bash

DEST=$(pwd)
mkdir -p ~/.config
mkdir -p ~/.local

ln -Tsf $DEST/HOME/local/bin ~/.local/bin
ln -Tsf $DEST/HOME/config/alacritty ~/.config/alacritty
ln -Tsf $DEST/HOME/tmux.conf ~/.tmux.conf
ln -Tsf $DEST/HOME/config/tmuxp ~/.config/tmuxp
ln -Tsf $DEST/HOME/config/systemd ~/.config/systemd
ln -Tsf $DEST/HOME/config/i3 ~/.config/i3
ln -Tsf $DEST/HOME/config/imv ~/.config/imv
ln -Tsf $DEST/HOME/config/sakura ~/.config/sakura
ln -Tsf $DEST/HOME/config/mpv ~/.config/mpv
mkdir -p  ~/.config/mpv/scripts
ln -Tsf /usr/lib/mpv/mpris.so ~/.config/mpv/scripts/mpris.so
ln -Tsf $DEST/HOME/config/dunst ~/.config/dunst
ln -Tsf $DEST/HOME/config/aria2 ~/.config/aria2
ln -Tsf $DEST/HOME/config/fontconfig ~/.config/fontconfig
ln -Tsf $DEST/HOME/config/feh ~/.config/feh
ln -Tsf $DEST/HOME/config/zathura ~/.config/zathura
ln -Tsf $DEST/HOME/config/user-dirs.dirs ~/.config/user-dirs.dirs
ln -Tsf $DEST/HOME/config/mimeapps.list ~/.config/mimeapps.list
ln -Tsf $DEST/HOME/config/gtk-3.0 ~/.config/gtk-3.0
ln -Tsf $DEST/HOME/config/pylintrc ~/.config/pylintrc
ln -Tsf $DEST/HOME/config/starship.toml ~/.config/starship.toml
ln -Tsf $DEST/HOME/vimrc ~/.vimrc
#ln -Tsf $DEST/HOME/emacs.d ~/.emacs.d
ln -Tsf $DEST/HOME/zsh ~/.zsh
ln -Tsf $DEST/HOME/zsh/zshrc ~/.zshrc
ln -Tsf $DEST/HOME/zsh/zlogin ~/.zlogin
ln -Tsf $DEST/HOME/xinitrc ~/.xinitrc
#ln -Tsf $DEST/HOME/xmodmap ~/.xmodmap
ln -Tsf $DEST/HOME/gitconfig ~/.gitconfig
ln -Tsf $DEST/HOME/gitignore ~/.gitignore
ln -Tsf $DEST/HOME/psqlrc ~/.psqlrc
ln -Tsf $DEST/HOME/pip ~/.pip
ln -Tsf $DEST/HOME/prettierrc.yaml ~/.prettierrc.yaml
ln -Tsf $DEST/HOME/npm.rc ~/.npm.rc

mkdir -p $HOME/.cargo
ln -Tsf $DEST/HOME/cargo/config ~/.cargo/config

#code_dir="$HOME/.config/Code - OSS"
code_dir="$HOME/.config/Code"
mkdir -p "$code_dir/User"
ln -Tsf $DEST/HOME/config/Code/User/snippets "$code_dir/User/snippets"
ln -Tsf $DEST/HOME/config/Code/User/settings.json "$code_dir/User/settings.json"
ln -Tsf $DEST/HOME/config/Code/User/keybindings.json "$code_dir/User/keybindings.json"
ln -Tsf $DEST/HOME/config/Code/User/locale.json "$code_dir/User/locale.json"

codium_dir="$HOME/.config/VSCodium"
mkdir -p "$code_dir/User"
ln -Tsf $DEST/HOME/config/Code/User/snippets "$codium_dir/User/snippets"
ln -Tsf $DEST/HOME/config/Code/User/settings.json "$codium_dir/User/settings.json"
ln -Tsf $DEST/HOME/config/Code/User/keybindings.json "$codium_dir/User/keybindings.json"
ln -Tsf $DEST/HOME/config/Code/User/locale.json "$codium_dir/User/locale.json"

sudo cp  $DEST/etc/modprobe.d/* /etc/modprobe.d
sudo cp  $DEST/etc/sysctl.d/* /etc/sysctl.d
