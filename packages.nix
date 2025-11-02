{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    neofetch
    zsh
    starship
    gh
    udisks
    hd-idle
    hdparm
  ];
  programs.zsh.enable = true;

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      add_newline = false;

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };

      package.disabled = true;
    };
  };

  # systemd.services.hd-idle = {
  #   description = "External HD spin down daemon";
  #   wantedBy = [ "multi-user.target" ];
  #   serviceConfig = {
  #     Type = "forking";
  #     ExecStart = "${pkgs.hd-idle}/bin/hd-idle -i 300 -c ata -I";
  #   };
  # };
}
