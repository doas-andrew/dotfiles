{ config, pkgs, ... }:
{
    system.stateVersion = "24.05";
    # To upgrade:
    #   sudo nix-channel --add https://nixos.org/channels/nixos-XX.XX nixos
    #   sudo nix-channel --update
    #   sudo nixos-rebuild --upgrade boot
    #   sudo nixos-rebuild --upgrade switch

    imports = [
        /etc/nixos/hardware-configuration.nix
        ./packages.nix
        ./services.nix
        ./awesome.nix
    ];

    #  boot.supportedFilesystems = [ "ntfs" ];
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.grub = {
        configurationLimit = 5;
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
        useOSProber = false;
    };

    # Internationalization
    time.timeZone = "America/Chicago";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "us";
    };

    # Wifi
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
    programs.nm-applet.enable = true;

    # Bluetooth
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = false;

    # Sound
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.systemWide = false;

    # Flakes
    # nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Environment Variables
    environment.sessionVariables.MY_OS = "NixOS";
    environment.sessionVariables.EDITOR = "nvim";
    environment.sessionVariables.GOPROXY = "direct";
    environment.sessionVariables.PGDATA = "$HOME/postgres";
}