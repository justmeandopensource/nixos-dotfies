{ config, pkgs, ... }: {
  services.xidlehook = {
    enable = true;
    not-when-audio = true;
    not-when-fullscreen = true;
    environment = {
      "PRIMARY_DISPLAY" =
        "$(${pkgs.xorg.xrandr}/bin/xrandr | awk '/ primary/{print $1}')";
    };
    timers = [
      {
        delay = 60;
        command = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output "$PRIMARY_DISPLAY" --brightness .1'';
        canceller = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output "$PRIMARY_DISPLAY" --brightness 1'';
      }
    ];

  };
}