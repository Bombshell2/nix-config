{ config, lib, pkgs, ... }:

{
  imports = [
    ../../home/shared.nix
  ];

  home.packages = with pkgs; [
    # utils
    amdgpu_top
    distrobox
    audacity
    mangohud

    # games
    vesktop
    protonup-qt
    protontricks
    prismlauncher
    r2modman
    ckan
    blockbench
    wlx-overlay-s
   
    # media
    blender
    krita
    weylus
    yt-dlp
  ];

  programs.git = {
    userName = "bombshell2";
    userEmail = "coleuu123@gmail.com";
    lfs.enable = true;
  };
  
  programs = {
    obs-studio = {
      enable = true;
    	plugins = with pkgs.obs-studio-plugins; [
  	    wlrobs
	      obs-backgroundremoval
	      obs-pipewire-audio-capture
	    ];
    };
  };

  home.stateVersion = "24.11";
}

