#!/bin/bash

info() {
	echo -e "\033[36m$1\033[0m"
}
warning() {
	echo -e "\033[31m$1\033[0m"
}
success() {
	echo -e "\033[32m$1\033[0m"
}

watch() {
	STATE_A=""
	while [[ true ]]
	do
		STATE_B=$(find -L . -type f -name "*.c" -exec md5 {} \;)
		if [[ $STATE_A != $STATE_B ]] ; then
			STATE_A=$STATE_B
			clear
			info "HEY BRO 👋 $(date)"

			NORM_ERROR=$(sed -e '/.*: OK!/d' <(norminette))
			if [[ $NORM_ERROR == "" ]] ; then
				success "\nNORMINETTE OK"
			else
				warning "\nNORMINETTE ERROR"
				echo "$NORM_ERROR"
			fi

			info "\nTESTS"
			make test

		fi
		sleep 0.1
	done
}

watch