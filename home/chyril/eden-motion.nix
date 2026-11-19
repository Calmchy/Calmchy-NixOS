{ pkgs, ... }:

{
  systemd.user.services.evdevhook2 = {
    Unit.Description = "evdevhook2 motion server (DSU) for Eden";
    Service = {
      ExecStart = "${pkgs.evdevhook2}/bin/evdevhook2";
      Restart = "always";
      RestartSec = 5;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
