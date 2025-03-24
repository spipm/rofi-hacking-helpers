#!/bin/bash

# Include options for base dir
# Helper init snippet
THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source ${THIS_SCRIPT_DIR}/init/options.sh

# Function to set up a keyboard shortcut using XFCE
setup_xfce_shortcut() {
    local shortcut_command="$1"
    local keybind="$2"

    echo "Setting up keyboard shortcut..."
    xfconf-query -c xfce4-keyboard-shortcuts -p "${keybind}" -t string -s "bash -e '$shortcut_command'" --create

    if [ $? -eq 0 ]; then
        echo -e "\e[32mShortcut successfully created! Use $keybind to launch the menu.\e[0m"
    else
        echo -e "\e[31mFailed to create shortcut. Please check your XFCE settings manually.\e[0m"
    fi
}

# Function to check if a keybinding already exists using gsettings
check_gsettings_keybinding() {
    local search_command="$1"

    echo "Checking if keybinding with command '$search_command' already exists..."
    local keybindings
    keybindings=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings | tr -d "[],'")

    for key in $keybindings; do
        local key_path="org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.$key"
        local command
        command=$(gsettings get "$key_path" command | tr -d "'")

        if [[ "$command" == *"$search_command" ]]; then
            echo -e "\e[32mKeybinding already exists:\e[0m $command"
            return 0
        fi
    done

    echo -e "\e[33mNo existing keybinding found for command '$search_command'.\e[0m"
    return 1
}

create_targets_folders() {
    mkdir -p ${BASEDIR_SESSION}
    mkdir -p ${SESSION_OUTPUT_DIR}
    mkdir -p ${SESSION_TARGETS_DIR}
    mkdir -p ${BASEDIR_SESSION}/playbook/

}
create_targets_files() {
    touch ${SESSION_TARGETS_DIR}/hosts
    touch ${SESSION_TARGETS_DIR}/users
    touch ${SESSION_TARGETS_DIR}/accounts
    touch ${SESSION_TARGETS_DIR}/passwords
    touch ${SESSION_TARGETS_DIR}/active_host
    touch ${SESSION_TARGETS_DIR}/active_user
    touch ${SESSION_TARGETS_DIR}/active_pass
    touch ${SESSION_TARGETS_DIR}/active_domain
    touch ${ACTIVE_PLAYBOOK_FILE}
}

# Main function to execute the script steps
main() {

    # Setup commands keybind
    local helper_commands="${BASEDIR_HELPER}/helper_commands.sh"
    local helper_commands_keybind="/commands/custom/<Primary><Shift>m"
    check_gsettings_keybinding "$helper_commands"
    if [ $? -ne 0 ]; then
        setup_xfce_shortcut "$helper_commands" "$helper_commands_keybind"
    else
        echo "Keybinding setup skipped as it already exists."
    fi

    # Setup targets keybind
    local helper_commands="${BASEDIR_HELPER}/helper_targets.sh"
    local helper_commands_keybind="/commands/custom/<Primary><Shift>k"
    check_gsettings_keybinding "$helper_commands"
    if [ $? -ne 0 ]; then
        setup_xfce_shortcut "$helper_commands" "$helper_commands_keybind"
    else
        echo "Keybinding setup skipped as it already exists."
    fi

    create_targets_folders
    create_targets_files

    echo -e "\n\e[32mSetup is complete. You can now use the commands menu with $helper_commands_keybind in your terminal.\e[0m"
}

# Run the main function
main
