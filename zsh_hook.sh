#!/usr/bin/zsh
[[ -z $precmd_functions ]] && precmd_functions=()
save_status() {
	ls --color=always -C > /tmp/.v2k-pane-out
}
precmd_functions+=save_status

