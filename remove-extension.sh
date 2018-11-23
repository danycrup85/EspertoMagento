#!/bin/bash

echo -e "\n----------------"
echo -e "LIST FILES FOUND"
echo -e "----------------\n"

if [ "" == "$2" ]; then

	find . | grep -ilr $1 . | nl

	if [ $(find . | grep -ilr $1 . | wc -l) -gt 0 ]; then
	
		echo -e "\nWant you remove files? [Y/n] "
		read remove || exit 1
  		case "$remove" in
  		[Nn]*) remove=n with=out;;
  		*)     remove=y with=;;
  		esac

		if [ 'y' = $remove ]; then
			echo -e "\nRemoving files and directories....\n"
			find . | grep -ilr $1 . | xargs -I file rm -frv file
			echo -e "\nRemove Complete!\n"
		else
			echo -e "\nNothing to remove.\n\n"
		fi

	else
		echo -e "\nNothing found.\n"
	fi

else
	find $2 | grep -ilr $1 $2 | nl

	if [ $(find $2 | grep -ilr $1 $2 | wc -l) -gt 0 ]; then
	
		echo -e "\nWant you remove files? [Y/n] "
		read remove || exit 1
  		case "$remove" in
  		[Nn]*) remove=n with=out;;
  		*)     remove=y with=;;
  		esac

		if [ 'y' = $remove ]; then
			echo -e "\nRemoving files and directories....\n"
			find $2 | grep -ilr $1 $2 | xargs -I file rm -frv file
			echo -e "\nRemove Complete!\n"
		else
			echo -e "\nNothing to remove.\n\n"
		fi

	else
		echo -e "\nNothing found.\n"
	fi

fi

echo -e "----------------------------------"
echo -e "THE SEARCH IS ENDED. THANK YOU! :)"
echo -e "----------------------------------\n"
exit;
