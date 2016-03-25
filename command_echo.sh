#!/usr/bin/zsh

[[ -z $precmd_functions ]] && precmd_functions=()
directory() {
    clear > ~/.v2k_print_pipe
	echo "$(pwd):\n$(ls -C --color=always)" > ~/.v2k_print_pipe
    #ls --color=always > ~/.v2k_print_pipe
}
precmd_functions+=directory

function accept-line() {
	#echo "${BUFFER}" > ~/.v2k_print_pipe
	zle .accept-line
}

zle -N accept-line
