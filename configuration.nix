
{ config, pkgs, ... }:

let

  primary_user = "venkatn";

in

{
  imports =
    [
      ./hardware-configuration.nix
      ./home.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "junix";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  #time.timeZone = "Asia/Calcutta";
  i18n.defaultLocale = "en_GB.UTF-8";

  services = {
    blueman.enable = true;
    cron = {
      enable = true;
      systemCronJobs = [
        "0 * * * *     ${primary_user} \$HOME/opt/scripts/backup"
      ];
    };
    vnstat.enable = true;
    xserver = {
      enable = true;
      layout = "gb";
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          greeters.mini = {
            enable = true;
            user = "${primary_user}";
            extraConfig = ''
              [greeter]
              show-password-label = false
              invalid-password-text = You are not Venkat. Are you?
              password-alignment = left
              [greeter-theme]
              border-width = 1px
              window-color = "#403f3f"
              password-color = "#a19f9f"
              password-border-width = 1px
              background-image = "/etc/nixos/files/monk-wallpaper-zoom-blurred.jpg"
            '';
          };
        };
      };
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          adapta-gtk-theme
          arandr
          betterlockscreen
          brightnessctl
          dmenu
          feh
          lxappearance
          networkmanagerapplet
          papirus-icon-theme
          pavucontrol
          picom
          playerctl
          ranger
          rofi
        ];
      };
      libinput.enable = true;
      #videoDrivers = [ "displaylink" "modesetting" ];
    };
    openssh.enable = true;
    printing = {
      enable = true;
      drivers = [ pkgs.cnijfilter2 ];
    };
  };

  environment = {
    pathsToLink = [ "/libexec" ];
    etc = {
      hosts.mode = "0644";
      "powerlevel10k/powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    };
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "5%";
    };
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

  users.users.${primary_user} = {
    isNormalUser = true;
    initialPassword = "password1234";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "vboxusers" "libvirtd" "docker" "audio" "input" ];
  };

  security.sudo.extraRules= [
    {  users = [ "${primary_user}" ];
      commands = [
         { command = "ALL" ;
           options= [ "NOPASSWD" ]; 
        }
      ];
    }
  ];
 
  environment.systemPackages = with pkgs; [
    alacritty
    bc
    docker-compose
    file
    firefox
    flameshot
    fusuma
    git
    htop
    keyutils
    killall
    leafpad
    libnotify
    libreoffice
    lm_sensors
    lsof 
    mpv
    mplayer
    redshift
    rclone
    ruby
    tree
    unzip
    vagrant
    vim
    virt-manager
    virt-viewer
    wget
    (pkgs.writers.writeDashBin "vboxmanage" ''
       ${pkgs.virtualbox}/bin/VBoxManage "$@"
    '')
    (
      let
        polybar = pkgs.polybar.override {
          pulseSupport = true;
        };
      in
      polybar
    )
    xdotool
    zathura
    zsh-powerlevel10k
  ];

  virtualisation = {
    docker = {
      enable = true;
    };
    libvirtd.enable = true;
    virtualbox = {
      host = {
        enable = true;
      };
    };
  };

  programs = {
    dconf.enable = true;
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
    };
  };

  fonts.fonts = with pkgs; [
    font-awesome
    meslo-lgs-nf
    roboto
  ];

  nixpkgs.config.allowUnfree = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  system = {
    autoUpgrade = {
      enable = true;
      dates = "daily";
    };
    stateVersion = "22.05";
  };

}

