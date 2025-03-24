function type_command {
  sleep $TYPING_DELAY;
  xdotool type --delay $TYPING_CHARACTER_DELAY "${1}";
}
export -f type_command


function type_newline {
  xdotool key Return
}
export -f type_newline


