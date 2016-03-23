#!/bin/bash
# Create logs for build process
#
. solution.conf
#clear file if needed
	> $HPE_Version"_Release.log"

#start things with the build name for the log and in the log
echo Running make log for: $HPE_Version
  echo $HPE_Version >> $HPE_Version"_Release.log"

  #prompt user if the file was edited, cause im a numbskull and i know ill forget
	echo "Did you finish editing the solution.conf? :(y/n)"
		read choice
	if [ $choice='y' ]
	then
			echo Running Make Tag:
		declare OUTPUT_MakeTag=$(./makeTag.sh $HPE_Version 2>&1)
			echo "$OUTPUT_MakeTag \n "
			echo "$OUTPUT_MakeTag \n " >> $HPE_Version"_Release".log
			
	else
        echo "returning.."
        return
	fi
		
	echo "Make Release? :(y/n)"
		read choice
	if [ $choice='y' ]
	then
			echo Running Make Release:
		declare OUTPUT_MakeRelease=$(./makeRelease.sh $HPE_Version 2>&1)
			echo "$OUTPUT_MakeRelease \n "
			echo "$OUTPUT_MakeRelease \n " >> $HPE_Version"_Release".log
	else
        echo "returning.."
        return
	fi
	
	echo "Get Components? :(y/n)"
		read choice
	if [ $choice='y' ]
	then
			echo Running Get Components:
		declare OUTPUT_GetComponents=$(./getComponents.sh 2>&1)
			echo "$OUTPUT_GetComponents \n "
			echo "$OUTPUT_GetComponents \n " >> $HPE_Version"_Release".log
	 else
        echo "returning.."
        return
	fi
	
	echo "Tar-up the packages? :(y/n)"
		read choice
	if [ $choice='y' ]
	then
			echo Running Tar Packages:
		declare OUTPUT_TarPackages=$(./TarPackages.sh 2>&1)
			echo "$OUTPUT_TarPackages \n "
			echo "$OUTPUT_TarPackages \n " >> $HPE_Version"_Release".log
	else
        echo "returning.."
        return
	fi
