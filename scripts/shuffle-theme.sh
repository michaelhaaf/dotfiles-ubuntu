#!/bin/bash

function pywal {
	wpg -a "$1";
	wal -i "$1"; 
#	razer-cli -a ;
#	i3-msg restart ;
	wal-discord ;
	beautifuldiscord --css "$HOME"/.cache/wal-discord/style.css ;

	# from the docs: adds <x> saturation to current scheme, then reapplies.
	# adjusted: the basename is the name of the them, see the wpg -a command
	wpg --sat "$(basename $1)" 0.1
}
		
pywal "$1"
