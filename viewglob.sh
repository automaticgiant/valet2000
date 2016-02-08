#!/bin/sh
set -e
set -v

socket_name=v2k
# shorthand
tm="tmux -L $socket_name"

$tm new-session -d -s user #"zsh zsh_hook.sh)\'; zsh -i"
#$tm new-window -d -t user -n user
$tm split-window -t user:0.0 -d 'while true; do clear; echo cwd:;cat /tmp/.v2k-pane-out; sleep .5; done'
$tm attach -t user

exit 0
# start tmux if needed
$tm start-server
# ensure aux session created
$tm has-session -t aux || $tm new-session -d -s aux
# ensure aux:viewglob window created
set +e
vg_window=$($tm list-windows | grep viewglob)
has_vg_window=$?
set -e
echo $has_vg_window
vg_window=$(echo $vg_window | head -n1 | cut -f1 -d:)
#$tm new-window -d -k -t aux:viewglob -n viewglob watch -n1 'clear;/tmp/.v2k-pane-out'
[[ has_vg_window -eq 0 ]] || $tm new-window -d -n viewglob watch -n1 'clear;/tmp/.v2k-pane-out'

# look at remain-on-exit

$tm join-pane -s aux:viewglob.! -t user:last.top


