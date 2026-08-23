{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    # fade = false;
    # fadeDelta = 4;
    shadow = false;
    shadowOpacity = 0.6;
    settings = {
      # corner-radius = 8;

      shadow-exclude = [
        "class_g = 'Plank'"
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
        "window_type = 'menu'"
        "window_type = 'popup_menu'"
        "window_type = 'dropdown_menu'"
      ];

      corner-radius-rules = [
        "0:class_g = 'Plank'"
      ];

      blur-method = "dual_kawase";
      blur-strength = 5;
      # blur-background-frame = false;
      blur-background-fixed = true;

      blur-background-exclude = [
        "class_g = 'Plank'"
        "_GTK_FRAME_EXTENTS@:c"
        "class_g = 'Xfce4-screenshooter'"
        "class_i = 'xfce4-screenshooter'"
      ];

       unredir-if-possible = true;
    };
  };
}