
{ config, lib, pkgs, ... }:

{
  #   ### Create a systemd service to copy the configuration file
  systemd.user.services.copy-hyprland-config = {
    description = "Create Hyprland configuration";
    wantedBy = [ "default.target" ];
    serviceConfig = {
    ExecStart = "/etc/nixos/scripts/hyprland-config.sh"; 
        };
     };

}
