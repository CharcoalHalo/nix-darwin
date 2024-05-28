{ pkgs, lib, ...}:
{
  users.users.fbright.home = "/Users/fbright";
  environment.systemPackages = with pkgs; [
    kitty
  ];

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
  };
}
