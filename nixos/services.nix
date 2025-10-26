{ config, ... }:
{
    # Bluetooth
    services.blueman.enable = true;

    # Virus Scanning
    services.clamav.daemon.enable = false;
    services.clamav.updater.enable = false;

    # Docker
    virtualisation.docker.enable = true;
    systemd.services.docker.wantedBy = [];

    # Text expansion
    services.espanso.enable = true;

    # Provides location information
    services.geoclue2.enable = false;

    # VPN
    services.mullvad-vpn.enable = true;

    # CUPS
    services.printing.enable = true;

    # Thumbnail generator
    services.tumbler.enable = true;

    # Allow USB mounting (with udiskie)
    services.udisks2.enable = true;

    # Touchpad support
    services.libinput.enable = false;

    # X
    services.xserver = {
        enable = true;
        xkb.layout = "us";
    };
}
