#!/bin/bash

# Helper init snippet
THIS_SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd ${THIS_SCRIPT_DIR}/init
source init.sh

# Show menu for directory
cd ${BASEDIR_HELPER}/helper_targets
dir_menu

