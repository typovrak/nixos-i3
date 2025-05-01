# 🪟 NixOS I3

> Declarative NixOS module to install and configure i3wm with Catppuccin mocha green styling, utilities and secure per-user config.

## 📦 Features

- 🔒 **Secure config scaffold :** Creates ```~/.config/i3``` with correct ownership/permissions and deploys your ```config``` file.

- 🎨 **Wallpaper & theme :** Installs ```i3.png``` wallpaper and uses Catppuccin mocha green colors in borders and dmenu.

- 🔧 **Essential tools :** Bundles dmenu, feh, playerctl, i3lock-color, pamixer, alacritty, brightnessctl, maim, chromium, nemo, pavucontrol and more.

- 🖥️ **Font support :** Enables JetBrainsMono Nerd Font via fontconfig for rich glyphs.

- 🚗 **NVIDIA ready :** Configures NVIDIA modesetting, prime sync, power management and more.

- 🔄 **Idempotent :** Safe on every rebuild, preserves credentials and backup.

- 💾 **Manual backups :** Backup commands are provided in the documentation to preserve existing files before changes if needed.

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

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
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

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
