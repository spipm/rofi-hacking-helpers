function dir_menu {
    DIR_LOCAL=$1

    # Combine and sort directories first, then files
    ENTRY=$(
        {
            # Directories (prepend icon, remove trailing slash)
            for d in *; do
                [ -d "$d" ] && echo "📁 ${d}"
            done | sort

            # Files
            for f in *; do
                [ -f "$f" ] && echo "$f"
            done | sort
        
        } | rofi -dmenu -p "🐱‍💻"
    )

    # If user made a selection
    if [ -n "$ENTRY" ]; then

        # If directory, recursively continue in directory
        if [[ $ENTRY == "📁 "* ]]; then

            cd "${ENTRY:2}"
            dir_menu
            return 1

        # Execute if it's a script
        else
            bash "${ENTRY}"
            return 2
        fi

    fi
}
export -f dir_menu