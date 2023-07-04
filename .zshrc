source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

bindkey "^[k" history-substring-search-up
bindkey "^[j" history-substring-search-down

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE

export GTK_THEME=Adwaita:dark
export GTK_ICON_THEME=Adwaita
export GTK_CURSOR_SIZE=48
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=48
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface cursor-size 48

export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland
export GDK_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME=gtk2

alias update="sudo pacman -Syu && yay -Syu"
alias sp="sudo pacman -S"
alias spr="sudo pacman -R"
alias ys="yay -S"
alias yr="yay -R"

alias c="clear"
alias h="htop"

alias n="nvim"

alias nnn="nnn -H -e -E"
alias feh="feh --zoom 50"

alias pdev="pnpm run dev"

alias gae="git add ."
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"

alias lsa="ls -a"
alias del="sudo rm -rf"
alias so="source ~/.zshrc"
alias findit="sudo find / -name"
alias diskfree="df -T -h | grep nvme0n1"

export EDITOR="$(which nvim)"
export VISUAL="$(which nvim)"

if [ "$(tty)" = "/dev/tty1" ];then
  exec Hyprland > /dev/null 2>&1
fi
