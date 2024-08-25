#!/bin/bash -e

if [[ "$OSTYPE" == "darwin"* ]]; then
  link_flags="-sF"
else
  link_flags="-sf"
fi

PACKER_PATH="~/.local/share/nvim/site/pack/packer/start/packer.nvim"

if ! $PACKER_PATH; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\\n \
			~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

ln $link_flags $DIR/nvim $HOME/.config/nvim
ln $link_flags $DIR/tmux/.tmux.conf $HOME/.tmux.conf
ln $link_flags $DIR/alacritty/ $HOME/.config/alacritty

./setup_zshrc.sh
