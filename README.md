[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

<div>
  <a href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos-i3"><img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos-i3&label=GET%20https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos-i3&labelColor=%23a6e3a1&countColor=%231e1e2e" /></a>
</div>

# 🪟 NixOS I3

> Declarative NixOS module to install and configure i3wm with Catppuccin mocha green styling, utilities and secure per-user config.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config scaffold :** Creates ```~/.config/i3``` with correct ownership/permissions and deploys your ```config``` file.
- 🎨 **Wallpaper & theme :** Installs ```i3.png``` wallpaper and uses Catppuccin mocha green colors in borders and dmenu.
- 🔧 **Essential tools :** Bundles dmenu, feh, playerctl, i3lock-color, pamixer, alacritty, brightnessctl, maim, chromium, nemo, pavucontrol and more.
- 🖥️ **Font support :** Enables JetBrainsMono Nerd Font via fontconfig for rich glyphs.
- 🚗 **NVIDIA ready :** Configures NVIDIA modesetting, prime sync, power management and more.
- 🔄 **Idempotent :** Safe on every rebuild, preserves credentials and backup.
- 💾 **Manual backups :** Backup commands are provided in the documentation to preserve existing files before changes if needed.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── config            # main i3wm configuration file
├── configuration.nix # module configuration
├── i3.png            # wallpaper used by default
├── LICENSE.md        # MIT license
└── README.md         # this documentation

1 directory, 5 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/i3{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-i3 = fetchGit {
    url = "https://github.com/typovrak/nixos-i3.git";
    ref = "main";
    rev = "88f0ee949ac7bc702b49b877d29db5fa018a8c2a"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-i3}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-i3 = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-i3.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-i3}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-i3.git &&
cd nixos-i3 &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

- Start i3: Login via LightDM or startx.
- Launch terminal : ```<OS> + <Enter>``` opens Alacritty.
- Run dmenu : ```<OS> + d``` with Catppuccin styling.
- Lock screen : ```<OS> + x``` uses i3lock-color.
- Adjust volume : audio keys or pamixer.
- Take screenshots : ```<Print>``` key, ```<OS> + <Print>```, or ```<Shift> + <Print>``` with maim.
- Navigate folders : ```<OS> + n``` with Nemo.
- Visit typovrak.tv : ```<OS> + c``` with chromium.
- Closing an application : ```<OS> + q```.

And a lot more.

## 📚 Learn more

- 🧩 [I3wm user guide](https://i3wm.org/docs/userguide.html) : Official reference for configuring and using i3.
- 🎨 [Catppuccin i3 theme](https://github.com/catppuccin/i3) : Color palette used in this module.
- 🖼️ [feh](https://wiki.archlinux.org/title/Feh) : Lightweight image viewer used to set wallpapers.
- 🔒 [i3lock-color](https://github.com/Raymo111/i3lock-color) : Fork of i3lock with extra visuals and customization.
- 🧰 [i3 ecosystem on Arch wiki](https://wiki.archlinux.org/title/I3) : Tools, extensions and recommended utilities.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
