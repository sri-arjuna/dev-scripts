cat << EOF
# Based on: fedora-live-base.ks
# Changed by: sea
#
#	System Settings
#
	lang $language
	keyboard $keyboard
	timezone $timezone

	auth --useshadow --enablemd5
	selinux --enforcing
	firewall --enabled --service=mdns
	firstboot --reconfig
	xconfig --startxonboot

	services --enabled=NetworkManager --disabled=network,sshd
#
#
#	Includes, order required
#	Default environment first
#
	%include 	/usr/share/spin-kickstarts/fedora-repo-not-rawhide.ks
#
#	Desktop Environment files
#
	%include	/usr/share/spin-kickstarts/fedora-livecd-$DE.ks
#
#
#	Custom Area
#
	# Disable the anaconda configuration if you plan to share the image!
	%include	/root/anaconda-ks.cfg
#
#	Post -- download section
#
%post --nochroot
	# '/' is the root of your host machine
	# \$INSTALL_ROOT represents the root of the sysimage
	echo TODO
	echo \$INSTALL_ROOT
%end
%post
	# '/' is the root of your virtual system image
	echo TODO
%end
%packages
#
# Basic GUI
#
	@core
	@hardware-support
	@standard
	@base-x

# Might be removable
	#dial-up
	@multimedia
#
# Required by LiveImage
#
	kernel
	memtest86+
	anaconda
	@anaconda-tools
	qemu-guest-agent
%end
EOF
