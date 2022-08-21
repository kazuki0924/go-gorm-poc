#!/usr/bin/env bash
set -Eeuo pipefail
IFS=$'\n\t'

# Installs both CLI and GUI tools
# expected to be executed from the project root

read -rp "Is Homebrew installed? [y/N]"$'\n> ' UserInput && [[ ${UserInput} != "y" ]] && exit 1
brew bundle --verbose --no-lock --file=Brewfile
read -rp "Is MacPorts installed? [y/N]"$'\n> ' UserInput && [[ ${UserInput} != "y" ]] && exit 1
sudo port install pgmodeler
./scripts/setup_and_install_with_pip.sh
