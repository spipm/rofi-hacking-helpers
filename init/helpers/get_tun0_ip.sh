function get_tun0_ip {
  if ip link show tun0 &> /dev/null; then
    echo "$(ip -o -4 addr show tun0 | awk '{print $4}' | cut -d/ -f1)"
  else
    echo "NO_IP"
  fi
}
export -f get_tun0_ip