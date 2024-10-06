#!/bin/bash

sync() {

	#SYNC Makefile SOURCES
	SOURCES=$(ls src/*.c | sed '/.*\/ft_lst.*/d' | tr '\n' ' ')
	SOURCES_BONUS=$(ls src/ft_lst*.c | tr '\n' ' ')

	SED_COMMAND="s;^SOURCES	.*;SOURCES		=	$SOURCES;"
	SED_COMMAND_BONUS="s;^SOURCES_BNS	.*;SOURCES_BNS	=		$SOURCES_BONUS;"
	if [[ $(uname) == "Linux" ]];  then
		sed -i "$SED_COMMAND" Makefile
		sed -i "$SED_COMMAND_BONUS" Makefile
	else
		sed -i "" "$SED_COMMAND" Makefile
		sed -i "" "$SED_COMMAND_BONUS" Makefile
	fi
}

sync "$@"
