dotfiles="$(cd "$(dirname "$0")" && pwd -P)"

if [ $MY_OS = 'NixOS' ]; then
    sudo ln -sfn $dotfiles/nixos/configuration.nix /etc/nixos/configuration.nix
fi

mkdir -p ~/.config
mkdir -p ~/.local/share
mkdir -p ~/.local/bin
mkdir -p ~/.ssh
mkdir -p ~/.ssh && cp -n $dotfiles/ssh/config-example ~/.ssh/config

ln -sfn $dotfiles/bin/* ~/.local/bin

if type alacritty;  then ln -sfn $dotfiles/alacritty                 ~/.config/alacritty;       fi
if type bat;        then ln -sfn $dotfiles/bat                       ~/.config/bat;             fi
if type clipcatd;   then ln -sfn $dotfiles/clipcat                   ~/.config/clipcat;         fi
if type conky;      then ln -sfn $dotfiles/conky                     ~/.config/conky;           fi
if type doas;       then sudo ln -sfn $dotfiles/doas/doas.conf        /etc/doas.conf;           fi
if type dunst;      then ln -sfn $dotfiles/dunst                     ~/.config/dunst;           fi
if type espanso;    then ln -sfn $dotfiles/espanso                   ~/.config/espanso;         fi
if type greenclip;  then ln -sfn $dotfiles/greenclip/greenclip.toml  ~/.config/greenclip.toml;  fi
if type hx;         then ln -sfn $dotfiles/helix                     ~/.config/helix;           fi
if type less;       then ln -sfn $dotfiles/less/.lesskey             ~/.lesskey;                fi
if type mpd;        then ln -sfn $dotfiles/mpd                       ~/.config/mpd;             fi
if type mpv;        then ln -sfn $dotfiles/mpv                       ~/.config/mpv;             fi
if type nvim;       then ln -sfn $dotfiles/nvim                      ~/.config/nvim;            fi
if type pcmanfm;    then ln -sfn $dotfiles/pcmanfm                   ~/.config/pcmanfm;         fi
if type rofi;       then ln -sfn $dotfiles/rofi                      ~/.config/rofi;            fi
if type tmux;       then ln -sfn $dotfiles/tmux                      ~/.config/tmux;            fi
if type wezterm;    then ln -sfn $dotfiles/wezterm                   ~/.config/wezterm;         fi
if type xmodmap;    then ln -sfn $dotfiles/x/Xmodmap                 ~/.Xmodmap;                fi
if type yazi;       then ln -sfn $dotfiles/yazi                      ~/.config/yazi;            fi

if type emacs; then
    mkdir -p ~/.config/emacs
    ln -sfn $dotfiles/emacs/init.el ~/.config/emacs/init.el
fi

if type zsh; then
    ln -sfn $dotfiles/zsh/zshrc  ~/.zshrc
    ln -sfn $dotfiles/zsh/zshenv ~/.zshenv

    if [ ! -d "$dotfiles/zsh/powerlevel10k" ]; then
        git clone https://github.com/romkatv/powerlevel10k $dotfiles/zsh/powerlevel10k
    fi
fi

case $XDG_CURRENT_DESKTOP in
    AWESOME)
        ln -sfn $dotfiles/awesome ~/.config/awesome
    ;;
    HYPRLAND)
        mkdir -p ~/.config/hypr
        ln -sfn $dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
        ln -sfn $dotfiles/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
    ;;
esac

case $MY_WINDOWING_SYSTEM in
    X)
        echo "nothing to do"
    ;;
    WAYLAND)
        ln -sfn $dotfiles/foot ~/.config/foot
        ln -sfn $dotfiles/wofi ~/.config/wofi
    ;;
esac
