{ config, pkgs, ... }: {

  gtk = {
    enable = true;
    font.name = "Roboto Regular 11";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Adapta-Nokto-Eta";
      package = pkgs.adapta-gtk-theme;
    };
  };

}
