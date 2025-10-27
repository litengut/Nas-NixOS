{ config, pkgs, ... }:

{
  users.users.max = {
    isNormalUser = true;
    description = "max";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false; # <— members of wheel can sudo without password
  };


  users.defaultUserShell = pkgs.zsh;
}
