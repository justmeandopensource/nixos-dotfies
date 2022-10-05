{ config, pkgs, ... }:

let

  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";

in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.venkatn = {

    imports = [
      ./modules/packages.nix
      ./modules/zsh.nix
      ./modules/alacritty.nix
      ./modules/dunst.nix
      ./modules/xidlehook.nix
      ./modules/picom.nix
    ];

    home.file.".config".source = ./files/config;
    home.file.".config".recursive = true;

    home.file."opt".source = ./files/opt;
    home.file."opt".recursive = true;

    home.file.".background-image".source = ./files/monk-wallpaper.jpg;
    home.file.".p10k.zsh".source = ./files/home/.p10k.zsh;
    home.file.".tmux.conf".source = ./files/home/.tmux.conf;

    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "org.qutebrowser.qutebrowser.desktop" ];
        "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
        "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
        "x-scheme-handler/about" = [ "org.qutebrowser.qutebrowser.desktop" ];
        "x-scheme-handler/unknown" = [ "org.qutebrowser.qutebrowser.desktop" ];
      };
    };

    xresources.properties = {
      "Xft.dpi" = 96;
      "Xcursor.theme" = "Breeze";
      "Xcursor.size" = 20;
    };

    home.stateVersion = "22.05";

  };
}
