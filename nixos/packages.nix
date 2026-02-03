{ config, pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [
            "openssl-1.1.1w"
        ];
    };

    # Define user accounts
    # Manually set a password for new users with `passwd`
    users.users.andrew = {
        isNormalUser = true;

        # "wheel" enables sudo for the user.
        extraGroups = [ "wheel" "docker" ];

        # User-specific packages
        packages = with pkgs;[
            cool-retro-term  # Mimics cathode display
        ];
    };

    users.defaultUserShell = pkgs.zsh;
    programs.direnv.enable = true;
    programs.zsh.enable = true;
    security.doas.enable = true;

    xdg.mime.defaultApplications = {
        "application/json" = "sublime_text.desktop";
        "application/pdf"  = "zathura.desktop";
        "application/x-sh" = "sublime_text.desktop";
        "application/xml"  = "sublime_text.desktop";
        "application/zip"  = "pcmanfm.desktop";
        "audio/webm"       = "mpv.desktop";
        "image/gif"        = "qView.desktop";
        "image/jpeg"       = "qView.desktop";
        "image/jpg"        = "qView.desktop";
        "image/png"        = "qView.desktop";
        "image/svg+xml"    = "qview.desktop";
        "image/webp"       = "qView.desktop";
        "text/html"        = "firefox.desktop";
        "text/markdown"    = "sublime_text.desktop";
        "text/plain"       = "sublime_text.desktop";
        "video/webm"       = "mpv.desktop";
    };

    environment.systemPackages = with pkgs; [
      ## Dev
        neovim                     # New vim with Lua-based configs
        neovide                    # Neovim GUI
        vscode                     # OSS editor by Microsoft
        vscodium                   # VScode minus the telemetry

      ## GUIs
        calibre                    # Epub reader
        dbeaver-bin                # SQL editor
        emacs                      # Fully extensible text editor
        firefox                    # Gecko browser
        flameshot                  # Screen capture tool
        gparted                    # System partition editor
        kazam                      # Simple screen recording
        keepassxc                  # Password management
        mpv                        # mpv plays video
        obsidian                   # Personal knowledge base
        qalculate-qt               # Qt calculator
        qview                      # Qt image viewer
        screenkey                  # Screencast your keys
        sublime4                   # Notepad replacement
        tauon                      # Music player
        zathura                    # PDF reader

      ## Utilities
        alacritty                  # GPU-accelerated terminal
        bat                        # Rusted cat; Lazy-loads big files!
        bat-extras.batdiff
        bat-extras.batgrep
        bat-extras.batman
        bat-extras.batpipe
        bat-extras.batwatch
        bat-extras.prettybat
        bottom                     # System monitor (btm)
        btop                       # System monitor
        cbonsai                    # Grow bonsai trees in your terminal
        cowsay                     # Generates ASCII cow saying something
        croc                       # File transfer CLI (ala magic wormhole)
        dust                       # Rusted du
        epr                        # CLI Epub reader
        eza                        # Rusted ls
        fd                         # Rusted find
        ffmpeg                     # Audio conversion tool
        fortune                    # Pseudorandom quote
        fzf                        # Fuzzy search
        git                        # Version control
        glow                       # Renders markdown in your terminal
        helix                      # Rusted kakoune
        htop                       # System monitor
        jq                         # JSON parser
        killall                    # Kill many processes by name or list of PIDs
        lsix                       # Shows thumbnails in terminal using sixel graphics
        neofetch                   # Print system info
        notify-desktop             # Script desktop notifications
        optipng                    # PNG optimizer
        pipes                      # Terminal "screensaver"
        procs                      # Rusted ps
        restic                     # Incremental backup
        ripgrep                    # Rusted grep
        rsync                      # Sync file directories
        sd                         # Rusted sed
        tmux                       # Terminal multiplexer
        tokei                      # Display statistics for a given repository
        udiskie                    # Removable disk automounter for udisks
        unzip                      # Extract .zip archives
        wezterm                    # Terminal configured with Lua
        wget                       # HTTP request CLI
        yazi                       # Terminal-based file browser
        yt-dlp                     # Archive videos

      ## Dependencies
        delta                      # Required by batdiff
        openssl                    # Required by many packages; Implements SSL and TLS
        slop                       # Required by Screenkey
        xclip                      # Required by Neovim; Syncs vim and system clipboards
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.commit-mono
        nerd-fonts.fira-code
        nerd-fonts.go-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.meslo-lg
        nerd-fonts.symbols-only
    ];
}
