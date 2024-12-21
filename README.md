# Pentest productivity hack with rofi
Use Rofi and xdotool to automate typing and run background tasks in Kali. It works in arbitrary applications (RDP session, browser, any shell, etc).

This is skeleton code with a few examples. Everyone is welcome to contribute.

## Installation
- Clone repo to ~/Desktop/base in Kali
  
`git clone git@github.com:spipm/rofi-hacking-helper.git ~/Desktop/base`
- Go to `Settings Manager`->`Keyboard`->`Application Shortcuts` and add a shortcut, like Ctrl+Shift+M to:

`/home/kali/Desktop/base/code/xdotool/rofisearch_scripts_menu.sh`
- Install `sudo apt install rofi -y` if not already installed
- Press Ctrl+Shift+M and execute scripts from anywhere

Some example scripts require other tools, like `zenity` or `pwsh`, but the idea is that you manage the scripts yourself.

## What it looks like

![](boon.gif)

## Limitations
- xdotool doesn't work in Wayland, so this works in Kali but not on Ubuntu.
- Because it's application independant it doesn't share your normal shell aliases.

## Todo
- A generic typing helper would be better to enhance readability. It would also allow adaptation of the scripts to Wayland.

## Other productivity tips
See [productivity tips](Productivity.md) for more general Kali productivity tips.
