#!/bin/bash -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

ln -s $DIR/nvim $HOME/.config/nvim
ln -s $DIR/tmux/.tmux.conf $HOME/.tmux.conf
