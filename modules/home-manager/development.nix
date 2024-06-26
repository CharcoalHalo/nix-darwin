{ pkgs, ... }:
{
 programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    userSettings = {
      "[nix]"."editor.tabsize" = 2;
      "editor.indentSize" = "tabSize";
      "telemetry.telemetryLevel" = "off";

      # macOS Modern Tweaks
      "editor.fontSize" = 12;
      "editor.fontFamily" = "SF Mono, Monaco";
      "editor.tabSize" = 2;
      "editor.fontWeight" = "normal";
      "window.titleBarStyle" = "native";
      "window.nativeTabs" = true;
      "window.zoomLevel" = -0.5;
      "workbench.iconTheme" = "macOS-modern-color-icon-theme";

      # Disable Tab File Icons
      "workbench.editor.showIcons" = false;
      # Disable Red Sidebar Errors
      "problems.decorations.enabled" = false;
    };
  };
}