#!/bin/sh
watch -n1 'for each in user; do echo session $each ; tmux -L v2k list-windows -t $each; tmux -L v2k list-panes -t $each:0 ; done'
