#! /bin/bash
set -e

RC_FILE=$HOME/.$(basename $SHELL)rc

CHECK_PATTERN="# Setup for bongbui321"

function add_script() {

cat >> $RC_FILE <<- EOF

$CHECK_PATTERN
LINUX_OP=\$HOME/linux_op
MAC_OP=\$HOME/mac_op
AGNOS=/Volumes/agnos

[[ -d \$LINUX_OP ]] && alias lo="cd \$LINUX_OP && source .venv/bin/activate"
[[ -d \$MAC_OP ]] && alias mo="cd \$MAC_OP && source .venv/bin/activate"
[[ -d \$AGNOS ]] && alias agnos="cd \$AGNOS"
EOF

}

grep "$CHECK_PATTERN" "$RC_FILE" &> /dev/null|| add_script
