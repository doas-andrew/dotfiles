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
            prismlauncher    # Minecraft launcher
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
        "text/markdown"    = "sublime_text.desktop";
        "text/plain"       = "sublime_text.desktop";
        "video/webm"       = "mpv.desktop";
    };

    environment.systemPackages = with pkgs; [
      ## Dev
        lua-language-server        # Neovim, AWM
        neovim                     # New vim with Lua-based configs
        neovide                    # Neovim GUI
        ngrok                      # Expose localhost ports (safely?)
        vscode                     # OSS editor by Microsoft
        vscodium                   # VScode minus the telemetry

      ## GUIs
        calibre                    # Epub reader
        dbeaver-bin                # SQL editor
        emacs                      # Fully extensible text editor; eLisp interpreter
        firefox                    # Gecko browser
        flameshot                  # Screen capture tool
        gparted                    # GUI system partition editor
        gpick                      # Color sampler
        kazam                      # Simple screen recording
        keepassxc                  # Password management
        mpv                        # mpv plays video
        obsidian                   # Trusted system
        qalculate-qt               # Qt calculator
        qview                      # Qt image viewer
        screenkey                  # Screencast your keys
        sublime4                   # Notepad replacement
        tauon                      # Music player
        yacreader                  # Comic/manga reader
        ymuse                      # mpd gui
        zathura                    # PDF reader

      ## UI-related
        conky                      # Display system information on the desktop
        dunst                      # Notification daemon
        redshift                   # Adjusts the display's color temperature
        rofi                       # Window switcher, run dialog and dmenu replacement
        tela-icon-theme            # GTK icon theme

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
        cava                       # Audio Visualizer for Alsa
        cbonsai                    # Grow bonsai trees in your terminal
        cowsay                     # Generates ASCII cow saying something
        croc                       # File transfer CLI (ala magic wormhole)
        du-dust                    # Rusted du
        epr                        # CLI Epub reader
        eza                        # Rusted ls
        fd                         # Rusted find
        ffmpeg                     # Audio conversion tool
        file                       # Get MIME types
        fortune                    # Pseudorandom quote
        fzf                        # Fuzzy search
        git                        # Version control
        glow                       # Renders markdown in your terminal
        helix                      # Rusted kakoune
        htop                       # System monitor
        jq                         # JSON parser
        killall                    # Kill many processes by name or list of PIDs
        lf                         # Terminal-based file browser, ala Ranger
        lsix                       # Shows thumbnails in terminal using sixel graphics
        mediainfo                  # Gets tag information about a video or audio file
        mpd                        # music player daemon
        neofetch                   # Print system info
        notify-desktop             # Works well with dunst
        pipes                      # Terminal "screensaver"
        pngcrush                   # PNG optimizer
        procs                      # Rusted ps
        restic                     # Incremental backup
        ripgrep                    # Rusted grep
        rsync                      # Sync file directories
        tmux                       # Terminal multiplexer
        tokei                      # Display statistics for a given repository
        unzip                      # Extract .zip archives
        wget                       # HTTP request CLI
        yt-dlp                     # Archive videos

      ## Dependencies
        ffmpegthumbnailer          # Video thumbnailer
        gnumake                    # Required by nvim telescope-fzf-native
        # llvmPackages_9.libcxxClang # Required by nvim telescope-fzf-native
        openssl                    # Implements SSL and TLS
        openvpn                    # Required by novpn; Secure VPN tunneling protocol
        ueberzug                   # Required by lf; Render image thumbnails
        slop                       # Required by Screenkey
        xclip                      # Required by Neovim; Syncs vim and system clipboards

      ## Ignore
        # clipcat                    # Rusted clipboard manager. No images
        # dutree                     # Rusted du
        # espanso                    # Text expansion
        # haskellPackages.greenclip  # Clipboard manager. Supports images!
        # kolourpaint                # Qt paint
        # krita                      # FOSS photoshop
        # discord                    # VOIP and chat
    ];

    fonts.packages = with pkgs; [
        # Don't pull in every nerdfont
        # https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
        (nerdfonts.override { fonts = [
            "Go-Mono"
            "FiraCode"
            "Mononoki"
            "Noto"
            "SourceCodePro"
        ];})

        alegreya-sans  # Humanist sans serif family with a calligraphic feeling
        meslo-lg       # Meslo, customized version of Apple's Menlo-Regular
        meslo-lgs-nf   # Meslo Nerd Font patched for Powerlevel10k
    ];
}
