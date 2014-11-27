#!/bin/bash
# ------------------------------------------------------------------------
#
# Copyright (c) 2014 by Simon Arjuna Erat (sea)  <erat.simon@gmail.com>
# All rights reserved.
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# ------------------------------------------------------------------------
#
#	dev-scripts is ment to be of assistance for Developers & Packagers
#
#
#
#	Variables
#
	TITLE="Developer Scripts"
	DIR=/usr/share/dev-scripts
	project_version="0.1"
#
#	Catch help
#
	case "$1" in
	"-h")	echo "$TITLE ($project_version)
Usage:	ds [section ..] [task] [options] [project]

Examples:
	ds prj rpm edit DEMO
	ds prj edit OTHERPRJ
	ds make -3 KICKSTARTPRJ
	ds prj ks make -3 KICKSTARTPRJ
	ds make -v PACKAGEPRJ

At any time you can simply start 'ds' and browse through the commands/tasks provided.
For more details, see either one of:
	* man ds
	* man dev-scripts
"
		exit $?
		;;
	esac
#
#	Action
#
	tui-browser 	-t "$TITLE" \
			-p "$DIR/menu" \
			-d Section \
			-f Commands \
			-m num \
			-C "$HOME/.config/dev-scripts/dev-scripts.conf" \
			-s "$DIR/incl" \
			$@
