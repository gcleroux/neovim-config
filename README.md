# neovim-config

🚧 **This is a WIP, and should be treated as such. It might not work at all on
your machine!** 🚧

My reproducible neovim configuration.

## Build prerequisites

### Debian

```bash
sudo apt install curl g++ gcc git ripgrep tar npm fd-find
```

This configuration requires the [GitHub CLI](https://github.com/cli/cli) tool to
fully utilize all of its features.

This neovim configuration also requires a Nerd Font to be installed on your
system.  
I recommend the `Cousine Nerd Font` font available [here](https://www.nerdfonts.com/font-downloads).

## Installing neovim

```bash
git clone https://github.com/gcleroux/neovim-config.git
cd neovim-config/
chmod +x install.sh
sudo ./install.sh
```

## Uninstalling neovim

```bash
chmod +x uninstall.sh
sudo ./uninstall.sh
```
