#!/bin/bash

# an experimental, incomplete script
# to install softwares from macOS Homebrew

RESET="\033[0m"
BLACK="\033[0;30m"
WHITE="\033[1;37m"
GREEN="\033[0;32m"

function install_core_utilities {
    brew install vim git tmux mosh wget
    brew install cmake pkg-config autoconf
    brew install reattach-to-user-namespace
    brew install terminal-notifier
    brew install the_silver_searcher ripgrep  # ag, rg
    brew install htop iftop
}

function install_extra_utilities {
    brew install imagemagick
    brew install m-cli
    brew install jq pandoc
    brew install colormake ccze               # colorize logs

    # cask
    #brew cask install exa
}

function install_all {
    echo -e "${GREEN}Running $0 ...${RESET}"
    brew update

    # invoke sub-tasks.
    install_core_utilities
    install_extra_utilities
}

if [ `uname` != "Darwin" ]; then
    echo "Run on macOS."; exit 1;
fi
if ! command -v brew 2>&1 > /dev/null; then
    echo "Homebrew not found. Please visit http://brew.sh/"
    exit 1;
fi

if [ -n "$1" ]; then
    $1
else
    echo "Usage: $0 [command], where command is one of the following:"
    declare -F | cut -d" " -f3 | grep -v '^_'
fi
