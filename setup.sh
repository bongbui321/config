#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

ln -s $DIR/nvim $HOME/.config/nvim
