{ config, pkgs, lib, ...}:
{
  imports = [
    ./brew.nix
    ./modules/darwin/dock.nix
    ./modules/darwin/finder.nix
  ];
  users.users.fbright.home = "/Users/fbright";

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # terminal tools
    bat
    btop
    gcc
    neofetch
    tree
    pciutils
    wget

    # archive tools
    zip
    unzip
    rar
    unrar
  ];

  nix = {
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
    package = pkgs.nix;#nixVersions.latest;
    # Enable Flakes
    settings.experimental-features = "nix-command flakes";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
}
