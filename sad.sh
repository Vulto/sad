#!/usr/bin/env bash
#
# sad : Simple application default
#
#
# Description:
# Takes files and get a mimetype
# Shows a list of applications to be used with this mimetype by default
# if there is no .desktop file in /usr/share/application it will be created
# after that, the script try to setup a default application to a given mimetype again

#filetype="xdg-mime query filetype" "$(fzf)" 
#program=$( ls /usr/share/applications/ | fzf) 

#echo $program $filetype

# TODO 
#Add some tests and store the results in variables
#Do some condition and create an .desktop if necessary

xdg-mime default 	 $( ls /usr/share/applications | fzf ) $( xdg-mime query filetype "$( fzf )" )

echo " The default program is properly configured! '-'"
