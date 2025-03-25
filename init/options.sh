
## xdotool opions
TYPING_DELAY=0.2          # Delay between rofi screen and typing      
TYPING_CHARACTER_DELAY=0  # Delay between characters

## Directory options
BASEDIR=/tmp/share_hacking
BASEDIR_HELPER=${BASEDIR}/code/hacking_helpers
BASEDIR_SESSION=${BASEDIR}/session
SESSION_OUTPUT_DIR=${BASEDIR_SESSION}/raw_output
SESSION_TARGETS_DIR=${BASEDIR_SESSION}/targets

## Storage files for targets (account, host, domain)
HOSTS_FILE=${SESSION_TARGETS_DIR}/hosts
USERS_FILE=${SESSION_TARGETS_DIR}/users
ACCOUNTS_FILE=${SESSION_TARGETS_DIR}/accounts
PASSWDS_FILE=${SESSION_TARGETS_DIR}/passwords

## Current targets 
CUR_TARGET_HOST_FILE=${SESSION_TARGETS_DIR}/active_host
CUR_TARGET_USER_FILE=${SESSION_TARGETS_DIR}/active_user
CUR_TARGET_PASS_FILE=${SESSION_TARGETS_DIR}/active_pass
CUR_TARGET_DOMAIN_FILE=${SESSION_TARGETS_DIR}/active_domain

HOST=$(cat $CUR_TARGET_HOST_FILE)
USER=$(cat $CUR_TARGET_USER_FILE)
PASS=$(cat $CUR_TARGET_PASS_FILE)
DOMAIN=$(cat $CUR_TARGET_DOMAIN_FILE)

## Playbooks (multi-line with unknown times in between)
ACTIVE_PLAYBOOK_FILE=${BASEDIR_SESSION}/playbook/active_playbook


