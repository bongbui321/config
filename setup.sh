#!/bin/bash -e

if [[ "$OSTYPE" == "darwin"* ]]; then
  link_flags="-sF"
else
  link_flags="-sf"
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

ln $link_flags $DIR/nvim $HOME/.config/nvim
ln $link_flags $DIR/tmux/.tmux.conf $HOME/.tmux.conf
ln $link_flags $DIR/alacritty/ $HOME/.config/alacritty

./setup_zshrc.sh
