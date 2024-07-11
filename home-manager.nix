{ config, pkgs, lib, ... }:
{
  home.username = "fbright";

  imports = [
    ./modules/home-manager/shell.nix
    ./modules/home-manager/development.nix
  ];

  home.packages = with pkgs; [
    raycast
    spotify
    obsidian
    keepassxc
    rectangle
    zoom-us
    utm
    qbittorrent
  ];


  
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;
}
