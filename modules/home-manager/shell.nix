{ pkgs, ... }:
let
  myAliases = {
    darwin-switch-mac = "darwin-rebuild switch --flake ~/.config/nix-darwin#Fletchers-MacBook-Air";
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
}