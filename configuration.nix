{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.i3 = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/i3
		mkdir ${home}/.config/i3
		chown ${username}:${group} ${home}/.config/i3
		chmod 700 ${home}/.config/i3

		cp ${./config} ${home}/.config/i3/config
		chown ${username}:${group} ${home}/.config/i3/config
		chmod 600 ${home}/.config/i3/config
	'';

	environment = {
		systemPackages = with pkgs; [
			dmenu
			feh
			playerctl
			i3lock-color
			pamixer
			alacritty
			brightnessctl
			maim
			chromium
			nemo
			pavucontrol
		];
		etc."wallpapers/i3.png".source = ./i3.png;
	};

	fonts = {
		enableDefaultPackages = true;
		fontconfig.enable = true;
		packages = with pkgs; [
			(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
		];
	};

	services.xserver = {
		enable = true;
		desktopManager.xterm.enable = true;
		windowManager.i3.enable = true;
		xkb = {
			layout = "us";
			variant = "altgr-intl";
		};
		videoDrivers = [ "nvidia" ];
	};

	hardware.nvidia = {
		modesetting.enable = true;
  		nvidiaSettings = true;
  		powerManagement.enable = true;
  		open = false;
  		prime = {
    		sync.enable = true;
    		intelBusId = "PCI:0:2:0";
    		nvidiaBusId = "PCI:1:0:0";
  		};
	};
}
