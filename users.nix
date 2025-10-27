{ config, pkgs, ... }:

{
  users.users.max = {
    isNormalUser = true;
    description = "max";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    initialPassword = "max";
  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false; # <— members of wheel can sudo without password
  };

  users.users.root.initialPassword = "max";
  users.defaultUserShell = pkgs.zsh;
}
