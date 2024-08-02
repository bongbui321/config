#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

ln -sf $DIR/nvim $HOME/.config/nvim
ln -sf $DIR/tmux/.tmux.conf $HOME/.tmux.conf

./setup_zshrc.sh
