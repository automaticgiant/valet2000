#!/bin/sh
set -e
set -v

socket_name=v2kcom
# shorthand
tm="tmux -L $socket_name"

$tm new-session -d -s user #"zsh zsh_hook.sh)\'; zsh -i"
#$tm new-window -d -t user -n user
$tm split-window -d -l 3 -t user:0.0
$tm attach -t user