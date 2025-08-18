{ config, lib, pkgs, ... }:

{
  home.username = "bombshell2";
  home.homeDirectory = "/home/bombshell2";
  home.sessionPath = [
    "/nix/store/y7y3q1ydq7m9ka1ycx9d922dd2rc2xi5-android-tools-35.0.1/bin"
  ];

  imports = [ 
    ../../home/programs/nixvim.nix 
    ../../home/shell/default.nix
    ../../home/sway/sway.nix
  ];

  home.packages = with pkgs; [
    # utils
    fastfetch
    nnn
    jq
    fzf
    gparted
    python3
    amdgpu_top
    distrobox
    lxqt.lxqt-policykit
    extundelete
    git

    # games
    vesktop
    protonup-qt
    protontricks
    prismlauncher
    r2modman
    ckan
    blockbench
    zoom
   
    # archives
    zip
    xz
    unzip
    p7zip

    # media
    vlc
    ffmpeg
    gimp
    pavucontrol
    blender
    krita
    kdePackages.dolphin

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
    libreoffice

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
    zulu23
  ];


  programs.git = {
    userName = "bombshell2";
    userEmail = "coleuu123@gmail.com";
  };
  
  programs = {
    firefox = {
      enable = true;
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
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}

