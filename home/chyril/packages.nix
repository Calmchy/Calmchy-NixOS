{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kate
    # Optional: includes ktexteditor components for root/sudo saving support
    kdePackages.ktexteditor
    kdePackages.konsole

    gamescope
  ];
}
