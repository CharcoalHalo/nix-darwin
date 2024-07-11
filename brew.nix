{ config, ... }: 
{
  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    casks = [
      "syncthing"
      "eclipse-java"
      "discord"
      "blender"
      "firefox"
      "linearmouse"
      "heroic"
      "steam"
      "betterdisplay"
      "stats"
      "godot"

      # Office
      "onedrive"
      "microsoft-word"
      "microsoft-powerpoint"
      "microsoft-excel"
    ];
    brews = [

    ];
  };
}