{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      output = {
        DP-3 = {
          resolution = "3440x1440@165Hz";
          position = "0,0";
        };
        HDMI-A-1 = {
          resolution = "1920x1080@60Hz";
          position = "3440,0";
        };
      };
      keybindings = let
        modifier = "Mod4";
      in lib.mkOptionDefault {
        "${modifier}+Shift+p" = "sticky toggle";
        "${modifier}+p" = "exec grim -g \"$(slurp)\"";
      };
      fonts = {
        names = ["Pango" "FontAwesome5Free"];
        style = "Monospace";
        size = "9";
      };
      startup = [
        {command = "firefox";}
      ];
    };
  };
  programs.i3blocks.bars.bottom = rec {
    time = {
      interval = 1;
    };
  };
}
