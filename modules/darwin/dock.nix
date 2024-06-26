{ ... }:
{
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.1;
    autohide-time-modifier = 0.3; # animation speed 

    launchanim = false; # disable app launch animation
    mineffect = "scale";
    minimize-to-application = false;
    orientation = "right";
    show-recents = false;
    showhidden = true;

    persistent-apps = [
      "/System/Applications/System Settings.app"
      "/Applications/Firefox.app"
      "${pkgs.kitty}/Applications/Kitty.app"
      "${pkgs.vscodium}/Applications/VSCodium.app"
      "/Applications/Eclipse Java.app"
      "/Applications/Discord.app"
      "${pkgs.spotify}/Applications/Spotify.app"
      "/Applications/KeePassXC.app"
    ];
    persistent-others = [
      "/Users/fbright/Library/CloudStorage/OneDrive-Personal"
      "/Users/fbright/Downloads"
    ];

    # Disable hot corners
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
  };
}