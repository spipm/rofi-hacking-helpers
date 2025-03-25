function split_term_horz {
  xdotool key ctrl+shift+d;
}
export -f split_term_horz

function split_term_vert {
  xdotool key ctrl+shift+r;
}
export -f split_term_vert

function set_tab_name {
  xdotool key alt+shift+s
  type_command "${1}"
  type_newline
}
export -f set_tab_name
