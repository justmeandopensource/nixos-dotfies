{ config, pkgs, ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Roboto 11";
        sort = "yes";
        indicate_hidden = "yes";
        word_wrap = "yes";
        stack_duplicates = "true";
        hide_duplicates_count = "false";
        width = 400;
        height = 300;
        origin = "top-center";
        offset = "10x50";
        scale = 0;
        notification_limit = 0;
        monitor = 0;
        follow = "none";
        transparency = 20;
        separator_height = 1;
        separator_color = "frame";
        frame_width = 1;
        frame_color = "#aaaaaa";
        line_height = 0;
        padding = 8;
        horizontal_padding = 8;
        icon_position = "off";
        max_icon_size = 80;
        mouse_left_click = "close_current";
        mouse_right_click = "close_all";
        text_icon_padding = 0;
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = "no";
        show_indicators = "yes";
        sticky_history = "yes";
        history_length = 20;
        corner_radius = 4;
      };

      urgency_low = {
        foreground = "#888888";
        background = "#222222";
        timeout = 8;
      };

      urgency_normal = {
        foreground = "#ffffff";
        background = "#0c5e4e";
        timeout = 8;
      };

      urgency_critical = {
        foreground = "#ffffff";
        background = "#900000";
        frame_color = "#ff0000";
        timeout = 0;
      };
    };
  };
}
