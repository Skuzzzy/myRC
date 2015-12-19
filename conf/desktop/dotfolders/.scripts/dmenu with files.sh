# All credit to Connor for this script
# https://github.com/REALDrummer

ls_flags=""
if [ "$#" -gt 0 -a "$1" = "--show-hidden-files" ]; then
	ls_flags="-a"
fi
with_sudo=""
if [ "$#" -gt 0 -a "$1" = "--gksudo" -o "$#" -gt 1 -a "$2" = "--gksudo" ]; then
	with_sudo="gksudo"
fi

dmenu_from_folder() {
	result=`ls $ls_flags "$1" --color=never | tail -n +2 | dmenu`
	file="$1/$result"
	if [ "$result" != "" ]; then
		if [ "$result" = "/" ]; then
			# go up to the root directory
			dmenu_from_folder /
		elif [ -f "$file" ]; then
			$with_sudo xdg-open "$file"
	        elif [ -d "$file" ]; then
	                dmenu_from_folder "$file"
		else
			# try again
			dmenu_from_folder "$1"
		fi
	fi
}

dmenu_from_folder ~
