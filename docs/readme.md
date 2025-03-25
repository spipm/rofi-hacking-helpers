## How it works

Pressing the shortcut will trigger one of the scripts (helper_commands.sh or helper_targets.sh). The scripts will run `init.sh`, which sets and exports variables and functions. The script will then `cd` into its corresponding directory and run `dir_menu`. This shows a menu with rofi. If you choose a script, it will run the script. If you choose a directory it will run a directory.

## API commands

The files in the `helper_` directories are batch scripts. The following variables are available from inside the scripts.
```
KALI_IP - Kali IP for tun0
HOST - Active host
USER - Active user
PASS - Active pass
DOMAIN - Active domain
```
See options.sh for more variables.

Inside the batch scripts one can use the following pre-defined commands.
```
type_command <cmd> - Waits for TYPING_DELAY seconds and then types a command with TYPING_CHARACTER_DELAY milliseconds between chars
type_newline - Type a newline (return key)
add_playbook_cmd <cmd> - Adds a command to the playbook file
split_term_horz - split terminal horizontal
split_term_vert - split terminal vertical
set_tab_name - set terminal tab name
```

## Playbook

The playbook file is just a file with a bunch of commands that can be typed with the `playbook_next` script. This script will type the first line, and it will then remove that line from the playbook file.

## Debugging

Consider directly running helper_commands.sh or helper_targets.sh if something doesn't work.

It can also help to `notify-send ..`

## Other productivity tips

- Use Kali's default shortcuts to split the terminal (Ctrl+Shift+D / Ctrl+Shift+R), use tabs (Ctrl+Shift+T / Ctrl+Shift+W) and rename tabs (Alt+Shift+S).
- Create symlinks from common locations - like your webroot - to your main workspace to centralize management of these files and directories.
- Manage custom shell aliases and functions for common tasks.
- Use a clipboard manager like [CopyQ](https://hluk.github.io/CopyQ/) to work with clipboard history, fuzzy searching, and other awesome features.
- Create scripts for your C2 software to automate common tasks. For example, you can create a Metasploit [rc script](https://github.com/PacktPublishing/Adversarial-Tradecraft-in-Cybersecurity/blob/main/Chapter3/auto_inject.rc) to automatically perform process injection.


