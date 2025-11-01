{ config, pkgs, ... }:

{
  users.users.max = {
    isNormalUser = true;
    description = "max";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    initialPassword = "max";
    openssh.authorizedKeys.keys = [
      # change this to your ssh key
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWlcJRGlRp8k+zzxzReZUs91V5MD3o3MTtmHw9ff/Yt"
    ];
    # this is used for unit-testing this module and can be removed if not needed

  };
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false; # <- members of wheel can sudo without password
  };

  users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWlcJRGlRp8k+zzxzReZUs91V5MD3o3MTtmHw9ff/Yt"
  ]; # this is used for unit-testing this module and can be removed if not needed

  users.users.root.initialPassword = "max";
  users.defaultUserShell = pkgs.zsh;
}
