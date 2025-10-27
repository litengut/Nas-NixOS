{
  modulesPath,
  lib,
  pkgs,
  ...
} @ args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    ./packages.nix
    # ./users.nix
    # ./networking.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = map lib.lowPrio [
    pkgs.curl
    pkgs.gitMinimal
  ];


  users.users.root.openssh.authorizedKeys.keys =
  [
    # change this to your ssh key
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAWlcJRGlRp8k+zzxzReZUs91V5MD3o3MTtmHw9ff/Yt"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDF2npECHZ7BwT6Q8kCFaTITjif1M78kM0ZHXA2j21SUElfsgWTJVvrM4G66utaAw/5IFWi4v//txV9kOCPxf7R+wsDHdXXGetmZRNLXdnXyGPXUiYTQFXnYkC5RiX903EBBNt7yjGyGHsyutGNZiAkB8+SE5PPx2VeUe+ZTyUw7LiWGsjgsBmLbgsvxsZBFW7vqcM92a1zktMlkYgB3ILZnMeID5IWi70NO6muHhlyJurNuRY4OeQ49+pDMWg7wJdL/RCLtV8Ck6grBB1woj7wl80NlpOCwmJZ4UaJVb4hTNHtn9V32gbgXjfIfpfh4SUnhSNaz1Yrnwg6O7+h2pZqKGXMUfITiiYhrM4dTBO4Kpxjp8hCvcNsxXu7c+0PMuljgEm36PoRAqmkeKd9lt9eNlKn62biNGviG9SAiiYqGOkq4BYIw5kLiIhWifkIkMZ9OrDLm9MT9IuU78GjrCSYc+/hOs8aa1F+tJ+TDij/zh1bV/E7pLk3qMl+Y8CyFZnjEo981L/vKUwtw3a5IA+88NwyrO524y/oVpkR0u8cFgAgE7olriFSYj0fkD4ZgmvK+pI9c2pXya8vbkNMuoY9XlRYUeNoYGzk2YRj7lYRQWDa/7FsIH3x9oNOaInsg/eUZtQ7C/rRQAoglBWgvrx/aBD/c8exQUZhE6ZlsiUdTw== litengut@icloud.com"
  ] ++ (args.extraPublicKeys or []); # this is used for unit-testing this module and can be removed if not needed

  system.stateVersion = "24.05";
}
