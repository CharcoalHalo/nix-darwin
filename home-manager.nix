{ config, pkgs, lib, ... }:
{
  home.username = "fbright";

  imports = [
    ./modules/home-manager/shell.nix
  ];

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
    zoom-us
  ];

  
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;
}
