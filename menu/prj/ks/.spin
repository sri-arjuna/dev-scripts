#!/bin/bash
#
#
#
#
#
	script_version=0.3
#
#	Variables
#
	toInstall=""
	stDir=/usr/share/script-tools
	test ! -z sE && source $stDir/st.cfg


	ksPath=/usr/share/spin-kickstarts
	ksCust=$ksPath/custom
	ksCustST=$SEA_DEV_DIR/$lbl/ks
	for custKS in $(ls $ksCustST);do ln -sf $ksCustST/$custKS $ksCust;done
	CustomList=""
	toInstall=""
	shcmd=""
#
#	Required Environment & applications
#
	test ! -f $stDir/st.cfg && echo "Requires sea Script-Tools." && return 1
	test ! 0 = $EUID && \
		sE "Script needs to be run as root." && \
		if ask "Reload it as root?"
		then	su -c "st iso spin"
			exit 0
		else	exit 1
		fi
	for app in livecd-tools spin-kickstarts pykickstart #revisor kvm qemu 
	do	sP "Parsing: $app" "$PROGRESS" 
		test "" = "$(rpm -q $app)" && toInstall="$toInstall $app"
	done
	test ! "" = "$toInstall" && \
		sudo yum install -y $toInstall || \
		sE "Required applications present." "$SUCCESS"
	for a in $@;do [ "$a" = "[-]-s" ] && shcmd=" --shell ";done
		
#
#	Select Kickstart file
#
	sE "Select a custom kickstart or a template?"
	select kickstyle in custom template;do break;done
	for entry in $(ls $ksCustST/*.ks);do 
		CustomList="$CustomList ${entry:${#ksCustST}+1}"
		ln -sf $entry $ksPath/$(basename $entry)
		ln -sf $entry $ksPath/custom/$(basename $entry)
	done
	case ${kickstyle:0:4} in
	cust)	select spin in $CustomList;do break; done
		spinfile=$ksCust/$spin
		label=${spin:0:$[ ${#spin} - 3 ]}
		;;
	temp)	select spin in $(ls $ksPath);do break; done
		spinfile=$ksPath/$spin
		label=$(input "What is the spin-label?")
		cat "$spinfile" > $ksCustST/$label.ks
		spinfile = $ksCustST/$label.ks
		sudo ln -s $ksCustST/$label.ks $ksCust/label.ks
		sudo chown $USER $ksCustST/$label.ks
		;;
	esac
#
#	Settings for spin
#	32|64bit, SELinux, Label
#
	setenforce 0
	if is64bit
	then	ask "Do you want to create $label as 32bit?" && \
		bit=yes || bit=no
	else	bit=no
	fi
#
#	Verify information & edit
#
	cmd="livecd-creator $shcmd --config=$spinfile --fslabel=$label"
	[ "$bit" = "yes" ] && cmd="setarch i686 $cmd"
	sE "The command that will be executed..."
	sE
	sE	"$cmd"
	sE
	if ask "Edit the file ($spinfile)?"
	then	sEdit "$spinfile"
	fi
	sE
	sE
#
#	Create the Spin
#
	sP "Generating required data to build $label" "$PROGRESS"
	cd $HOME
	$cmd && sE "Successfully built $HOME/$label.iso" "$SUCCESS" || \
		sE "Failed to build $label" "$FAILURE"
