{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	environment = {
		systemPackages = with pkgs; [
			dmenu
			feh
		];
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
	};
}
