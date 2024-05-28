{ config, pkgs, lib, ... }:
{
  home.username = "fbright";

  programs.java = {
    enable = true;
    package = pkgs.openjdk22;
  };

  home.packages = with pkgs; [
    raycast
    spotify
    obsidian
    keepassxc
    vscodium
    rectangle
    # syncthing
#    ungoogled-chromium
#    librewolf
    zoom-us
#    vesktop
  #   rpcs3
  ];

  programs.zsh.enable = true;  
  programs.zsh.oh-my-zsh = {
    enable = true;
    extraConfig = ''
      alias nix-darwin-switch="darwin-rebuild switch --flake ~/.config/nix-darwin#Fletchers-MacBook-Air"
    '';
  };
  
  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;
}
