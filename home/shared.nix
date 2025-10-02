{ config, lib, pkgs, ... }:

{
  home.username = "bombshell2";
  home.homeDirectory = lib.mkForce "/home/bombshell2";

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
    gammastep
    brightnessctl
    wget
    
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
    kdePackages.dolphin

    # misc
    tree
    file
    which
    gawk
    gnupg
    lua
    appimage-run
    undollar
    libnotify
    lxqt.lxqt-policykit
    extundelete

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
    libreoffice
    git
    hub

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

  programs = {
    git = {
      userName = "bombshell2";
      userEmail = "coleuu123@gmail.com";
      lfs.enable = true;
    }; 
    firefox = {
      enable = true;
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

  programs.home-manager.enable = true;
}
