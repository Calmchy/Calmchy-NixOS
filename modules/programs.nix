{ config, pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      oh-my-posh init fish --config $HOME/.poshthemes/if_tea.omp.json | source
      set -g fish_greeting ""
    '';
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}