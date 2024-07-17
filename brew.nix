{ config, ... }: 
{
  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    global.autoUpdate = true;
    onActivation.cleanup = "zap"; # uninstall all apps not in the brew.nix file
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
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
      "caffeine"
      "jdownloader"
      "sf-symbols"

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