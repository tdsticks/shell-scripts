#!/bin/bash

vepath=~/.virtualenv
cd $vepath

bkupfolder=~/Projects/Stickel/virtualenv_bkup/

vedir=$(ls -1)
# echo $vedir


#
# Loop over the virtualenv directories and
# dump out requirement files, then move to
# bkup folder
#
for dir in $vedir
do
	# This ignores the "arch" folder
	if [ "$dir" == "arch" ] ; then
		continue;
	fi

	echo $dir

	cd $vepath/$dir/bin
	echo $vepath/$dir/bin

	source activate
	echo source activate

	req=$dir"_requirements.txt"

	pip freeze > $vepath/$req
	echo $vepath/$req

	conda deactivate

	echo ""
done

#
# Lets move all the requirement files to the bkup folder
#
cd $vepath

mv *.txt $bkupfolder



