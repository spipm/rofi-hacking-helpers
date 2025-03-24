# Pentest productivity hacking helpers

Use Rofi and xdotool to automate typing and run background tasks in Kali. It works in arbitrary applications (RDP session, browser, any shell, etc).

This is skeleton code with a few examples. Everyone is welcome to contribute.

This repo is the original experimental skeleton codebase for the hacking helper scripts. If you'd like a *ready-to-use user experience* check out the fork from [dvdknaap](https://github.com/dvdknaap/rofi-hacking-helper/tree/main).

## Current helpers

- A command helper do quickly type commands (`crtl+shift+m`)
- A target helper to manage targets like active account, host, etc (`crtl+shift+k`)

## Installation

- Install dependencies
```
sudo apt-get install yad rofi powershell yad
```
- Choose a `BASEDIR` directory, for example `~/Desktop/base` and install.
```
mkdir ~/Desktop/base
mkdir ~/Desktop/base/code
git clone https://github.com/spipm/rofi-hacking-helpers.git ~/Desktop/base/code/hacking_helpers
```
- Configure `BASEDIR` in `/init/options.sh`. Note that this repo should exist as `BASEDIR/code/hacking_helpers`
- Run instal.sh to set shortcuts

## What it should look like

![](docs/boon.gif)

## Limitations
- xdotool doesn't work in Wayland, so this works in Kali but not on Ubuntu.
- Because it's application independent it doesn't share your normal shell aliases. If you'd like to use your normal aliases you'd need to include them in init.sh and export the variables and functions.
