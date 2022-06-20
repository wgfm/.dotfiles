#!/usr/bin/env bash

config_dirs=nvim pgcli starship tmux zsh

for dir in $config_dirs; do
  stow -D $dir
  stow $dir
done

