{ config, pkgs, ... }:
{
    environment.sessionVariables.FILE_MANAGER = "pcmanfm";
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
    environment.sessionVariables.MY_WINDOW_MANAGER = "HYPRLAND";
    environment.sessionVariables.MY_WINDOWING_SYSTEM = "WAYLAND";
    environment.sessionVariables.TERMINAL = "foot";

    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;

    environment.systemPackages = with pkgs; [
        cliphist                # Clipboard manager
        font-manager            # Browse installed fonts
        foot                    # Wayland terminal emulator
        hypridle                # Idle daemon
        hyprlock                # Screen locking utility
        hyprpanel               # Wayland bar
        hyprpicker              # Color sampler
        # hyprshell             # Available next release
        hyprsunset              # Blue light filter
        kdePackages.ark         # File archiver
        pavucontrol             # PulseAudio Volume Control
        pcmanfm                 # GTK file manager
        swww                    # Animated wallpaper daemon
        tela-icon-theme         # GTK icon theme
        transmission_4-gtk      # BitTorrent client
        wl-clipboard            # Copy/paste utilities
        wofi                    # Scriptable menu program
    ];
}
