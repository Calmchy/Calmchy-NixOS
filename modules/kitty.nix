{ pkgs, ... }:

{
  environment.etc."xdg/kitty/kitty.conf".text = ''
    font_family JetBrainsMono Nerd Font
    font_size 10
    background_opacity 0.7
    window_padding_width 8
    confirm_os_window_close 0

    # window size
    remember_window_size  no
    initial_window_width  800
    initial_window_height 500

    # tabs
    tab_bar_style powerline
    tab_powerline_style slanted

    # keybinds
    map ctrl+shift+t new_tab
    map ctrl+shift+w close_tab
    map ctrl+shift+l next_tab
    map ctrl+shift+h previous_tab
    map f11 toggle_fullscreen
  '';

  environment.systemPackages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}