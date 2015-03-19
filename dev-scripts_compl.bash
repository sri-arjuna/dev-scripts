#!/usr/bin/env bash
# bash completition for dev-scripts
# file: /etc/bash_completion.d/dev-scripts_compl.bash
# 2014.11.21 by sea, based on blkid
# ---------------------------------

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
	# This completes the custom entries from $DIR
	# But only use this, if 'prev' was one using entries from $DIR
	# This list is dynamicly (automaticly) updated
	case $prev in
	"-"[36v]|add|make|list|edit|review|status)
		case $cur in
		""|[a-zA-Z]*)	COMPREPLY=( $( compgen -W "$(cd $DIR 2>/dev/null && echo $cur*)" -- "$cur" ) ) 
				return 0
				;;
		esac
		;;
	esac
	
	# This completes the word you are currently writing
	# These need manual maintainance
	case $cur in
		-*)	COMPREPLY=( $(compgen -W "${OPTS[*]}" -- $cur) )
			return 0
			;;
		a*)	COMPREPLY=( $(compgen -W "add" -- $cur) )
			return 0
			;;
		b*)	COMPREPLY=( $(compgen -W "" -- $cur) )
			return 0
			;;
		c*)	COMPREPLY=( $(compgen -W "changelog commit" -- $cur) )
			return 0
			;;
		e*)	COMPREPLY=( $(compgen -W "edit" -- $cur) )
			return 0
			;;
		g*)	COMPREPLY=( $(compgen -W "git" -- $cur) )
			return 0
			;;
		i*)	COMPREPLY=( $(compgen -W "info" -- $cur) )
			return 0
			;;
		k*)	COMPREPLY=( $(compgen -W "ks" -- $cur) )
			return 0
			;;
		l*)	COMPREPLY=( $(compgen -W "list" -- $cur) )
			return 0
			;;
		m*)	COMPREPLY=( $(compgen -W "make manpage" -- $cur) )
			return 0
			;;
		n*)	COMPREPLY=( $(compgen -W "new" -- $cur) )
			return 0
			;;
		p*)	COMPREPLY=( $(compgen -W "prj" -- $cur) )
			return 0
			;;
		r*)	COMPREPLY=( $(compgen -W "review rpm" -- $cur) )
			return 0
			;;
		s*)	COMPREPLY=( $(compgen -W "setup ssh status" -- $cur) )
			return 0
			;;
	esac
	
	# This shows a list of words applying to your last argument
	# These need manual maintainance
	case $prev in
	# -c is left here optionaly for later, probably be used for 'review'
	# This lists the files of current path.
	#	'-c')
	#		local IFS=$'\n'
	#		compopt -o filenames
	#		COMPREPLY=( $(compgen -f -- $cur) )
	#		return 0
	#		;;
		""|"-"[36v]|add|make|list|edit|review|status)
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
# Actualy make it available to the shell
complete -F _dev-scripts_module ds
