{ config, pkgs, ... }: {

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    fadeSteps = [ "0.03" "0.03" ];
    inactiveDim = "0.4";
    vSync = true;

    shadow = true;
    shadowOpacity = "0.5";
    shadowOffsets = [ 1 1 ];
    shadowExclude = [
      "class_g ?= 'i3-frame'"
    ];

    opacityRule = [
      "85:class_g = 'Alacritty'"
      "85:class_g = 'Rofi'"
      "90:class_g = 'Leafpad'"
      "90:class_g = 'Blueman-manager'"
      "90:class_g = 'Nm-connection-editor'"
      "95:class_g = 'Pcmanfm'"
      "90:class_g = 'Pavucontrol'"
      "90:class_g = 'Code'"
      "80:class_g = 'Polybar'"    
    ];

    extraOptions = ''
      focus-exclude = [ "class_g = 'mpv'" ];
      unredir-if-possible = true;
      detect-rounded-corners = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
      shadow-radius = 5;
    '';

  };

}
