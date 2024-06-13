{ config, pkgs, lib, ...}:
{
  imports = [
    ./brew.nix
  ];
  users.users.fbright.home = "/Users/fbright";

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    
  ];


  fonts = {
    fontDir.enable = true;
    fonts = with pkgs;[
      powerline-fonts
      jetbrains-mono
      font-awesome_5
    ];
  };
  nix = {
    gc = {
      automatic = true;
    };
    package = pkgs.nix;#nixVersions.latest;
    # Enable Flakes
    settings.experimental-features = "nix-command flakes";
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
}
