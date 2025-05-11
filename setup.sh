#!/bin/bash -e

if [[ "$OSTYPE" == "darwin"* ]]; then
  link_flags="-sF"
else
  link_flags="-sf"
fi

PACKER_PATH="~/.local/share/nvim/site/pack/packer/start/packer.nvim"

if [[ ! $PACKER_PATH ]]; then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\\n \
			~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

NVIM_DEST=$HOME/.config/nvim
if [[ -L $NVIM_DEST ]]; then
  rm $NVIM_DEST
fi


TMUX_DEST=$HOME/.tmux.conf
if [[ -L $TMUX_DEST ]]; then
  rm $TMUX_DEST
fi

ALAC_DEST=$HOME/.config/alacritty
if [[ -L $ALAC_DEST ]]; then
  rm $ALAC_DEST
fi

ln $link_flags $DIR/nvim $HOME/.config/nvim
ln $link_flags $DIR/tmux/.tmux.conf $HOME/.tmux.conf
ln $link_flags $DIR/alacritty/ $HOME/.config/alacritty

./setup_zshrc.sh
