function add_playbook_cmd {
  echo "${1}" >> $ACTIVE_PLAYBOOK_FILE
}
export -f add_playbook_cmd