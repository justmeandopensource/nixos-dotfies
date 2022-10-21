{ config, pkgs, ... }: {

  home.sessionVariables = { TERMINAL = "alacritty"; };

  programs.alacritty = {

    enable = true;

    settings = {

      live_config_reload = true;

      window = {
        title = "Alacritty";
        padding = {
          x = 5;
          y = 5;
        };
      };

      shell = {
        program = "tmux";
        args = [
          "new-session"
          "-A"
          "-D"
          "-s"
          "main"
        ];
      };

      cursor = {
        style = {
          shape = "underline";
        };
        unfocused_hollow = false;
      };

      font = {
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };

        bold = {
          family = "MesloLGS NF";
          style = "Bold";
        };

        italic = {
          family = "MesloLGS NF";
          style = "Italic";
        };

        bold_italic = {
          family = "MesloLGS NF";
          style = "Bold Italic";
        };

        size = 14.0;
      };

      draw_bold_text_with_bright_colors = true;

      colors = {
        primary = {
          background = "#29353B";
          foreground = "#C1C1C1";
        };

        cursor = {
          cursor = "#E8E8E8";
        };

        normal = {
          black = "#1d1f21";
          red = "#cc6666";
          green = "#7CC844";
          yellow = "#f0c674";
          blue = "#33B5E1";
          magenta = "#b294bb";
          cyan = "#4ABDA7";
          white = "#c5c8c6";
        };

        bright = {
          black = "#666666";
          red = "#d54e53";
          green = "#b9ca4a";
          yellow = "#e7c547";
          blue = "#33B5E1";
          magenta = "#c397d8";
          cyan = "#70c0b1";
          white = "#eaeaea";
        };
        dim = {
          black = "#131415";
          red = "#864343";
          green = "#777c44";
          yellow = "#9e824c";
          blue = "#556a7d";
          magenta = "#75617b";
          cyan = "#5b7d78";
          white = "#828482";
        };

      };

    };

  };

}
