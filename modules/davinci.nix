{ config, lib, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix];
  environment.systemPackages = with pkgs; [
	  kitty
	  mesa-demos
	  vulkan-tools
	  clinfo
  	davinci-resolve
  ];
  environment.variables={
	  RUSTICL_ENABLE="radeonsi";
	  ROC_ENABLE_PRE_VEGA = "1";
  };
 hardware.graphics = {
   extraPackages = with pkgs; [
     mesa
     libva
     libvdpau-va-gl
     vulkan-loader
     vulkan-validation-layers
     amdvlk  # Optional: AMD's proprietary Vulkan driver
     mesa.opencl  # Enables Rusticl (OpenCL) support
   ];
 };
}
