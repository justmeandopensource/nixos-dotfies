{ config, pkgs, ... }:

let

  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";

in
{
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.venkatn = {

    home.packages = with pkgs; [
      awscli2
      bitwarden
      bitwarden-cli
      copyq
      gimp
      gnucash
      jq
      kube3d
      kubectl
      kubectx
      kubernetes-helm
      k9s
      minder
      pipe-viewer
      qutebrowser
      simplescreenrecorder
      slack
      teams
      tfswitch
      thunderbird
      tmux
      todoist-electron
      vscode
      yt-dlp
      (
        let 
          my-python-packages = python-packages: with python-packages; [ 
            colored
            GitPython
            humanize
            icalendar
            paramiko
            pyfiglet
            python-binance
            python-vagrant
            requests
            setuptools
            scp
            tabulate
          ];
          python-with-my-packages = python3.withPackages my-python-packages;
        in
        python-with-my-packages
      )
    ];

    home.file.".config".source = ./files/config;
    home.file.".config".recursive = true;

    home.file."opt".source = ./files/opt;
    home.file."opt".recursive = true;

    home.file.".background-image".source = ./files/monk-wallpaper.jpg;
    home.file.".p10k.zsh".source = ./files/home/.p10k.zsh;
    home.file.".tmux.conf".source = ./files/home/.tmux.conf;
    home.file.".Xresources".source = ./files/home/.Xresources;
    home.file.".zshrc".source = ./files/home/.zshrc;

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

    home.stateVersion = "22.05";

  };
}
