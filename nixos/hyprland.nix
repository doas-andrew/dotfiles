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
        ark
        cliphist
        font-manager
        hyprpaper
        hyprpicker
        pavucontrol
        pcmanfm
        swayidle
        swww
        transmission-gtk
        udiskie
        wl-clipboard
        wofi
    ];
}
