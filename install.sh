#!/bin/bash

ROOT_UID=0

# Get the path to neovim binaries
NVIM_BIN=$("$(pwd)/bin")

#COLORS
CDEF="\033[0m"      # default color
b_CCIN="\033[1;36m" # bold info color
b_CGSC="\033[1;32m" # bold success color
b_CRER="\033[1;31m" # bold error color
b_CWAR="\033[1;33m" # bold warning color

# echo like ...  with  flag type  and display message  colors
prompt() {
    case ${1} in
    "-s" | "--success")
        echo -e "${b_CGSC}${@/-s/}${CDEF}"
        ;; # print success message
    "-e" | "--error")
        echo -e "${b_CRER}${@/-e/}${CDEF}"
        ;; # print error message
    "-w" | "--warning")
        echo -e "${b_CWAR}${@/-w/}${CDEF}"
        ;; # print warning message
    "-i" | "--info")
        echo -e "${b_CCIN}${@/-i/}${CDEF}"
        ;; # print info message
    *)
        echo -e "$@"
        ;;
    esac
}

# Installing neovim bin from source
nvim_install() {
    # Installing neovim from bin
    NVIM_VERSION=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
    curl -LO "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb"
    curl -LO "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.deb.sha256sum"
    if [ "$(sha256sum -c nvim-linux64.deb.sha256sum)" != "nvim-linux64.deb: OK" ]; then
        prompt -e "\n Neovim checksum failed."
        exit 1
    fi
    sudo apt install -y ./nvim-linux64.deb
    rm ./nvim-linux64.deb ./nvim-linux64.deb.sha256sum
}

# Checking for root access and proceed if it is present
if [ "$UID" != "$ROOT_UID" ]; then
    # Error message
    prompt -e "This script should be run as root.\n"
    prompt -e "Operation canceled."
    exit 1
fi

# Installing neovim
prompt -i "\nInstalling Neovim bin from source.\n"
nvim_install

prompt -s "Neovim was installed successfully!"

read -rp "
Do you wish to install lazygit/markdown-toc? (recommended) [Y/n] " yn

case $yn in
# Default to yes
[Yy]* | "")
    # Installing lazygit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
    su - "$SUDO_USER" -c "curl -Lo lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    su - "$SUDO_USER" -c "tar xf lazygit.tar.gz -C $NVIM_BIN lazygit"

    # Installing markdown-toc
    su - "$SUDO_USER" -c "npm install markdown-toc && ln -sf $(pwd)/node_modules/markdown-toc/cli.js $NVIM_BIN/markdown-toc"
    prompt -i "\nYou should add [$NVIM_BIN] to your \$PATH to enable lazygit/markdown-toc functionalities."
    ;;
*)
    prompt -w "\nLazygit will not be installed.\n"
    ;;
esac

# Copying config files to XDG_CONFIG_HOME
su - "$SUDO_USER" -c "ln -sf '$(pwd)/config' '${XDG_CONFIG_HOME:-$HOME/.config}/nvim'"

# PackerUpdate must be run twice for every plugins to work
nvim --headless -u NONE -c "lua require(\"plugins.packer\")" \
    -c "lua require(\"plugins.packer\")" \
    -c ":PackerCompile" \
    -c ":PackerUpdate" \
    -c ":PackerUpdate" \
    -c ":q"
