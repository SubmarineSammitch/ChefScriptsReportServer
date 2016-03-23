#!/bin/bash
#
#Package up the tars and send them to the builds location on the server
#
. solution.conf

make_tar_and_send ()
{
	#get project name and shorten for file location
		#The capture group captures all non-_ characters prior to the first _,
		# the first _, and all non-_ characters prior to the next _.
		edit=$HPE_Version
		[[ $edit =~ ([^_]*_[^_]*)_ ]]
 		HPE_location=${BASH_REMATCH[1]}

	# get vendor folders
		echo Getting Vendor folders
		
	#tar files up and compress using .gz
		if [ "$(ls -A Juniper)" ]
			then 
				echo Tar-ing Juniper
				tar -zcf Juniper.tar.gz --exclude='.svn' Juniper/* 
			else
				echo No Tango directory
		fi
		
		if [ "$(ls -A Procera)" ]
			then 
				echo Tar-ing Procera
				tar -zcf Procera.tar.gz --exclude='.svn' Procera/* 
			else
				echo No Procera directory
		fi
		
		if [ "$(ls -A Tango)" ]
			then
				echo Tar-ing Tango
				tar -zcf Tango.tar.gz --exclude='.svn' Tango/*
			else
				echo No Tango directory
		fi
		
		if [ "$(ls -A Velankani)" ]
			then
				echo Tar-ing Velankani
				tar -zcf Velankani.tar.gz --exclude='.svn' Velankani/*
			else
				echo No Velankani directory
		fi
			run_CleanUp
	#tar individual vendor folders in a main archive also compressing
			echo Creating main tar for build $HPE_Version
		tar -zvcf $HPE_Version.tar.gz Juniper.tar.gz Tango.tar.gz Procera.tar.gz Velankani.tar.gz
		
	#send tar build to file location on backup server for archiving
			echo Copying build tar to build directory 
		if [ -d /home/builds/$HPE_location/$HPE_Build_Folder ]
		then
			echo "Folder exists overwrite (y/n)?"
			read choice
				if [ $choice = 'y' ]
				then
					cd /home/builds/$HPE_location
					rm -rf $HPE_Build_Folder
					cd /home/svn/sandbox/$HPE_location/trunk
				else
					echo "returning"
					return
				fi
			fi	
		# create directory for HS build
		echo "Creating $HPE_Version folder"
			cd /home/builds/$HPE_location/
		mkdir $HPE_Build_Folder
			cd /home/svn/sandbox/$HPE_location/trunk
		
		echo "moving tar to build folder $HPE_Build_Folder"
		mv $HPE_Version.tar.gz /home/builds/$HPE_location/$HPE_Build_Folder/
			cd /home/builds/$HPE_location/$HPE_Build_Folder
		pwd
		ls -al
		return
}

run_CleanUp () {

# remove all files not needed in the HPE_CPE and 
# HPE_DMNO folders after the vendors have been 
# zipped up and before the main folders are zipped
	echo clean up files? y/n
	read cleaner
		if [ $cleaner = 'y' ] 
		then
			file_location=$(pwd)

			find $file_location ! -name "*.tar.gz" ! -name "README.txt" -type d -exec rm -rf {} \;
			find $file_location ! -name "*.tar.gz" ! -name "README.txt" -type f -exec rm -r
		else
			return
		fi
}

#
# Main
#
# Check what version to get
#
# Get components
#
echo "Starting the tar of files"
make_tar_and_send

echo Done!

