cp ~/.bash_profile .
cp ~/.bashrc .
cp ~/.p10k.zsh .
cp ~/.zshrc .
cp ~/.tmux.conf .
rsync -a --delete ~/iterm2 .
rsync -a --delete ~/.config/htop ./.config
rsync -a --delete ~/.config/coc ./.config
rsync -a --delete ~/.config/nvim ./.config
rsync -a --delete ~/.config/solargraph ./.config
rsync -a --delete ~/.config/iterm2 ./.config
rsync -a --delete ~/.config/i3 ./.config
rsync -a --delete ~/.config/i3status ./.config
rsync -a --delete ~/.aliases/* ./.aliases
