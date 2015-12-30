#!/usr/bin/env bash
source ./configure.yassi
source ./*dirs.conf

cat > ./ds <<-EO_FILE
#!/usr/bin/env bash
# ------------------------------------------------------------------------
#
# Copyright (c) 2014-2016 by Simon Arjuna Erat (sea)  <erat.simon@gmail.com>
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
#	Variables
#
 	#. tuirc	# Not yet needed
 	TITLE="$APP_TITLE"
 	APP=$APP_NAME
 	VERSION=$APP_VER
 	# Dirs
 	DS_DIR_INSTALLED="${DS_DIR_INSTALLED:-/usr/share/\$APP}"
 	DS_DIR_CONFIG="\${XDG_CONFIG_DIR:-\$HOME/.config}/\$APP"
 	DS_DIR_ORG="\$PWD"
 	DS_DIR_MENU="\$DS_DIR_INSTALLED/menu"
 	DS_DIR_INCL="\$DS_DIR_INSTALLED/incl"
 	# Files
 	DS_FILE_CONF="\$DS_DIR_CONFIG/\$APP.conf"
 	# Export them
 	export DS_DIR_CONFIG DS_DIR_MENU DS_DIR_INCL DS_DIR_ORG DS_FILE_CONF
#
#	Catch help
#
 	case "\$1" in
 	"-h"|"--help"|"-?"|"--?")
 		echo "\$APP (\$TITLE) (\$VERSION)
Usage:	ds [section ..] [task] [ [options] [project] ]

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
 		exit \$?
 		;;
 	esac
#
#	Action
#
 	tui-browser 	-T "\$TITLE" \\
 			-D Section \\
 			-F Commands \\
 			-c "\$DS_FILE_CONF" \\
 			-s "\$DS_DIR_INCL" \\
 			-p "\$DS_DIR_MENU" \\
 			"\${@}"
EO_FILE
chmod +x ./ds
