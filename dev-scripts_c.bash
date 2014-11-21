# bash completition for dev-scripts
# 2014.11.21 by sea, based on blkid
#
_dev-scripts_module()
{
#
#	Variables
#
	local cur prev OPTS DIR
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	OPTS="-3 -6 -h -v"
	DIR="$HOME/.config/dev-scripts/prjs"
#
#	Action
#
	case $cur in
		-*)	COMPREPLY=( $(compgen -W "${OPTS[*]}" -- $cur) )
			return 0
			;;
	esac
	case $prev in
	# -c is left here optionaly for later
	#	'-c')
	#		local IFS=$'\n'
	#		compopt -o filenames
	#		COMPREPLY=( $(compgen -f -- $cur) )
	#		return 0
	#		;;
		"-"[36v]|add|make|list|edit|review)
			COMPREPLY=( $( compgen -W "$(cd $DIR 2>/dev/null && echo *)" -- "$cur" ) ) 
			return 0
			;;
		rpm)
			COMPREPLY=( $(compgen -W "add changelog edit list make" -- $cur) )
			return 0
			;;
		ks)
			COMPREPLY=( $(compgen -W "add edit make" -- $cur) )
			return 0
			;;
		prj)	
			COMPREPLY=( $(compgen -W "git ks rpm edit list" -- $cur) )
			return 0
			;;
		git)
			COMPREPLY=( $(compgen -W "add commit edit status upl" -- $cur) )
			return 0
			;;
		ssh)
			COMPREPLY=( $(compgen -W "info make setup" -- $cur) )
			return 0
			;;
		new)
			COMPREPLY=( $(compgen -W "manpage" -- $cur) )
			return 0
			;;
		ds)
			COMPREPLY=( $(compgen -W "new prj ssh add make review setup" -- $cur) )
			return 0
			;;
		'-h')
			return 0
			;;
	esac
}
complete -F _dev-scripts_module ds
