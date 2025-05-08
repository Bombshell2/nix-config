{ config, lib, pkgs, ... }:

{
  home.username = "bombshell2";
  home.homeDirectory = "/home/bombshell2";

  home.packages = with pkgs; [
    # utils
    fastfetch
    nnn
    jq
    fzf

    # games
    vesktop
    protonup-qt
    protontricks
    prismlauncher
    alvr
   
    # archives
    zip
    xz
    unzip
    p7zip

    # media
    gpu-screen-recorder
    vlc
    pavucontrol

    # misc
    tree
    file
    which
    gawk
    gnupg
    lua

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    ];

   programs.git = {
    enable = true;
    userName = "bombshell2";
    userEmail = "coleuu123@gmail.com";
   };
  
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      output = {
	DP-3 = {
	  resolution = "3440x1440";
	  position = "0,0";
	};
	HDMI-A-1 = {
	  resolution = "1920x1080";
	  position = "3440,0";
	};
      };
      keybindings = let
      modifier = "Mod4";
      in lib.mkOptionDefault {
	"${modifier}+Shift+p" = "sticky toggle";
      };
      fonts = {
	names = ["Pango" "FontAwesome5Free"];
	style = "Monospace";
	size = "9";
      };
      startup = [
	{command = "firefox";}
	{command = "gpu-screen-recorder";}
      ];
    };
  };

  services.mako.enable = false;

  programs = {
    firefox = {
      enable = true;
      #profiles.default = {
       # name = "default";
       # id = "0";
	#isDefault = true;

      #  userchrome = "
      #  #TabsToolbar
      #  {
       #   visibility: collapse;
	#}";
      #};
    };
    obs-studio = {
      enable = true;
	plugins = with pkgs.obs-studio-plugins; [
	  wlrobs
	  obs-backgroundremoval
	  obs-pipewire-audio-capture
	];
    };
    alacritty = {
      enable = true;
      settings.colors = {
	primary.background = "#292d3e";
	primary.foreground = "#d0d0d0";

	normal.black = "#292d3e";
	normal.red = "#f07178";
	normal.green = "#c3e88d";
	normal.yellow = "#ffcb6b";
	normal.blue = "#82aaff";
	normal.magenta = "#c792ea";
	normal.cyan = "#89ddff";
	normal.white = "#d0d0d0";

	bright.black = "#434758";
	bright.red = "#ff8b92";
	bright.green = "#ddffa7";
	bright.yellow = "#ffe585";
	bright.blue = "#9cc4ff";
	bright.magenta = "#e1acff";
	bright.cyan = "#a3f7ff";
	bright.white = "#ffffff";
      };
    };
    bash = {
      enable = true;
      enableCompletion = true;
    };
    neovim = {
     enable = true;
     viAlias = true;
     vimAlias = true;
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

