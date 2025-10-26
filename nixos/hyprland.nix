{ config, pkgs, ... }:
{
    environment.sessionVariables.FILE_MANAGER = "pcmanfm";
    environment.sessionVariables.MOZ_ENABLE_WAYLAND = "1";
    environment.sessionVariables.MY_WINDOWING_SYSTEM = "WAYLAND";
    environment.sessionVariables.TERMINAL = "foot";
    environment.sessionVariables.XDG_CURRENT_DESKTOP = "HYPRLAND";

    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    programs.waybar.enable = true;

    environment.systemPackages = with pkgs; [
        cliphist              # Clipboard manager
        font-manager          # Browse installed fonts
        hyprpaper             # Wallpaper utilities
        hyprpicker            # Color sampler
        kdePackages.ark       # File archiver
        pavucontrol           # PulseAudio Volume Control
        pcmanfm               # GTK file manager
        swayidle              # Idle management daemon
        swww                  # Animated wallpaper daemon
        tela-icon-theme       # GTK icon theme
        transmission_4-gtk    # BitTorrent client
        wl-clipboard          # Copy/paste utilities
        wofi                  # Scriptable menu program
    ];
}
