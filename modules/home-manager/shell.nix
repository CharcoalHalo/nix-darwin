{ pkgs, ... }:
let
  myAliases = {
    nix-switch-darwin = "darwin-rebuild switch --flake ~/.config/nix-darwin#Fletchers-MacBook-Air";
  };

in {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };

  programs.kitty = {
    enable = true;
    font.name = "SF Mono";
    font.size = 13;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = -1; # only on shells with running tasks
      font_family = "SF Mono";
      background_opacity = "0.6";
      background_blur = 16;
    };
  };
}