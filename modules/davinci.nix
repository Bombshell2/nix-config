{ config, lib, pkgs, ... }:
{
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
     mesa.opencl  # Enables Rusticl (OpenCL) support
   ];
 };
}
