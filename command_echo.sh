#!/usr/bin/zsh
#[[ -z $zle-line-finish ]] && echo working#precmd_functions=()

function accept-line() {
	echo "the line ${BUFFER} was entered" >> log.txt
	tmux run-shell -t 0.1 "echo 'Command: ${BUFFER}'"
	zle .accept-line
}

zle -N accept-line

#save_status() {
#	ls --color=always -C > /tmp/.v2k-pane-out
#}
#precmd_functions+=save_status

