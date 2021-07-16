#!/bin/bash

function pywal {
	theme=`find ~/Pictures/Wallpapers/ | sort -R | tail -1`
	wpg -a "$theme";
#	i3-msg restart ;


	# from the docs: adds <x> saturation to current scheme, then reapplies.
	# adjusted: the basename is the name of the them, see the wpg -a command
	wpg --sat "$(basename $theme)" 0.1
	wpg -A "$(basename $theme)"
	wpg -s "$(basename $theme)"
	
	wal-discord ;
}
		
pywal 
