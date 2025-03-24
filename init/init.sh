
# Set options
set -a # Automatically exports all vars from options
source options.sh
set +a

# Include and export all commands (export happens in the helper scripts)
for file in helpers/*.sh; do
  [ -f "$file" ] || continue  # Skip if not a regular file
  source "$file"
done

# Set values from functions
export KALI_IP=$(get_tun0_ip)
