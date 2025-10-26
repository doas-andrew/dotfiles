{ config, pkgs, ... }:
{
    environment.sessionVariables.FILE_MANAGER = "pcmanfm";
    environment.sessionVariables.MY_WINDOWING_SYSTEM = "X";
    environment.sessionVariables.TERMINAL = "alacritty";
    environment.sessionVariables.XDG_CURRENT_DESKTOP = "AWESOME";

    services.xserver.windowManager.awesome.enable = true;
    services.greenclip.enable = true;
    services.picom = {
        enable = true;
        vSync = true;
    };

    programs.i3lock.enable = true;

    environment.systemPackages = with pkgs; [
        alttab                # Window switcher
        autorandr             # Automatically configures connected displays
        conky                 # Display system information on the desktop
        font-manager          # Browse installed fonts
        gpick                 # Color sampler
        kdePackages.ark       # File archiver
        lxappearance          # Configure themes for GTK applications
        pasystray             # PulseAudio system tray
        pavucontrol           # PulseAudio Volume Control
        pcmanfm               # GTK file manager
        redshift              # Adjusts the display's color temperature
        rofi                  # Scriptable menu program
        tela-icon-theme       # GTK icon theme
        transmission_4-gtk    # BitTorrent client
        xidlehook             # Executes commands when the computer idles
        xorg.xmodmap          # Modifies keymaps and pointer button mappings
    ];
}
