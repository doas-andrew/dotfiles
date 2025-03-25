{ config, pkgs, ... }:
{
    environment.sessionVariables.FILE_MANAGER = "pcmanfm";
    environment.sessionVariables.MY_WINDOWING_SYSTEM = "X";
    environment.sessionVariables.TERMINAL = "alacritty";
    environment.sessionVariables.XDG_CURRENT_DESKTOP = "AWESOME";

    services.xserver.windowManager.awesome.enable = true;

    services.picom = {
        enable = true;
        vSync = true;

        #  activeOpacity = 1.0;
        #  inactiveOpacity = 1.0;

        #  fade = false;
        #  fadeDelta = 10;
        #  fadeSteps = [ 0.1 0.1 ];
        #  fadeExclude = [];

        #  shadow = false;
        #  shadowExclude = [
          #  "name ~= 'Firefox'"
        #  ];
    };

    environment.systemPackages = with pkgs; [
        alttab
        ark
        autorandr
        font-manager
        i3lock
        lxappearance
        pasystray
        pavucontrol
        pcmanfm
        transmission_4-gtk
        udiskie
        xidlehook
        xorg.xmodmap
    ];
}
