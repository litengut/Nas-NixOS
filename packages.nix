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
}
