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
        font-manager
        i3lock
        lxappearance
        pavucontrol
        pcmanfm
        transmission-gtk
        udiskie
        volctl
        xidlehook
        xorg.xmodmap
    ];
}
