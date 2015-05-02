Developer Scripts
=================

Beeing a project manager, it is ment to help you with different tasks a developer come across on a daily basis.

In an ideal world, once configured, all you do is to type: **ds make PROJECTLABEL**.

In the end, it should help/ease your tasks with:
* build
* code sync
* package
* repo
* review packages
* release packages
* create and build livecds


Overview of the Functions:
=========================
ds
+ add
+ edit
+ make
+ (review)
+ setup
 | + git
 | + ks
 | + mock
 | + rpm
 | + ssh
 | | + info
 | | + make
 | | + setup+ prj
 | + edit LBL
 | + git
 | | + add
 | | + edit
 | | + upl
 | rpm
 | | + add
 | | + edit
 | | + list
 | | + make

Installation
============
This table should give a brief preview of where to place the files.
This setting is for a proper system wide installation.
docs	|	/usr/share/dev-scripts/docs
incl	|	/usr/share/dev-scripts/incl
man/\*	|	/usr/share/man/man1
menu	|	/usr/share/dev-scripts/menu
templates	|	/usr/share/dev-scripts/templates
dev-scripts\_compl.bash	|	/usr/share/bash-completion
ds.sh	|	/usr/bin/ds
