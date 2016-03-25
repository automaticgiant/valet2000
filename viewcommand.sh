#!/bin/sh
set -e
set -v

if [[ ! -p ~/.v2k_print_pipe ]]; then
    mkfifo ~/.v2k_print_pipe
fi

socket_name=v2kcom
# shorthand
tm="tmux -L $socket_name"

$tm new-session -d -s user #"zsh zsh_hook.sh)\'; zsh -i"
#$tm new-window -d -t user -n user
$tm split-window -dl 6 -t user:0.0 "while true; do cat ~/.v2k_print_pipe; done"
$tm attach -t user