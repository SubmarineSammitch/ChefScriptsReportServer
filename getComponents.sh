#!/bin/bash
#
# HPE_DMNO: Script to get Vendors Products from SVN
#

#
# Get the solution configuration information
#
. solution.conf

#
# Get Procera Components
#
get_Procera_Components ()
{
    
    if [ -d Procera ]
    then
        echo "Procera directory already exists."
        echo "Do you want to overwrite (y/n)?-->"
        read choice
        if [ $choice = 'y' ]
        then
            echo "Removing existing Procera directory"
            rm -rf Procera
        else
            echo "returning.."
            return
        fi
    fi
    echo "Creating Procera directory"
    mkdir Procera
    cd Procera
	
	#Getting PBS
	if [ ! -z $PBS_Version ]
	then
		echo "Creating PBS directory"
			mkdir PBS
			cd PBS
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Procera PSM $PBS_Version
					svn checkout $SVN_LOCATION/Procera/PBS/tags/$PBS_Version .
				else
					echo Getting Procera PSM $HPE_Version
					svn checkout $SVN_LOCATION/Procera/PBS/tags/$HPE_Version .
				fi
		cd ..
	fi
	
	#Getting PSM
	if [ ! -z $PSM_Version ]
	then
		echo "Creating PSM directory"
			mkdir PSM
			cd PSM
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Procera PSM $PSM_Version
					svn checkout $SVN_LOCATION/Procera/PSM/tags/$PSM_Version .
				else
					echo Getting Procera PSM $HPE_Version
					svn checkout $SVN_LOCATION/Procera/PSM/tags/$HPE_Version .
				fi
		cd ..
	fi
	
	#Getting PRE
	if [ ! -z $PRE_Version ]
	then
		echo "Creating PRE directory"
			mkdir PRE
			cd PRE
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Procera PSM $PRE_Version
					svn checkout $SVN_LOCATION/Procera/PRE/tags/$PRE_Version .
				else
					echo Getting Procera PSM $HPE_Version
					svn checkout $SVN_LOCATION/Procera/PRE/tags/$HPE_Version .
				fi
		cd ..
	fi
	
	#Getting PIC
	if [ ! -z $PIC_Version ]
	then
		echo "Creating PIC directory"
			mkdir PIC
			cd PIC
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Procera PIC $PIC_Version
					svn checkout $SVN_LOCATION/Procera/PIC/tags/$PIC_Version .
				else
					echo Getting Procera PIC $HPE_Version
					svn checkout $SVN_LOCATION/Procera/PIC/tags/$HPE_Version .
				fi
		cd ..
	fi

#Getting PLclient
        if [ ! -z $PLclient_Version ]
        then
                echo "Creating PLclient directory"
                        mkdir PLclient
                        cd PLclient
                                if [ $HPE_Version == "trunk" ]
                                then
                                        echo Getting Procera PLclient $PLclient_Version
                                        svn checkout $SVN_LOCATION/Procera/PLclient/tags/$PLclient_Version .
                                else
                                        echo Getting Procera PLclient $HPE_Version
                                        svn checkout $SVN_LOCATION/Procera/PLclient/tags/$HPE_Version .
                                fi
                cd ..
        fi


	cd ..
    return
	
}

#
# Get Velankani Components
#
get_Velankani_Components ()
{
    choice='y'
    if [ -d Velankani ]
    then
        echo "Velankani directory already exists."
        echo "Do you want to overwrite (y/n)?-->"
        read choice
        if [ $choice = 'y' ]
        then
            echo "Removing existing Velankani directory"
            rm -rf Velankani
        else
            echo "Exiting.."
            exit
        fi
    fi
    echo "Creating Velankani directory"
    mkdir Velankani
    cd Velankani
	
	#Getting RTF
	if [ ! -z $RTF_Version ]
	then
		echo "Creating RTF directory"
		mkdir RTF
			cd RTF
				if [ $HPE_CPE_Version == "trunk" ]
				then
					echo Getting Velankani RTF $RTF_Version
					svn checkout $SVN_LOCATION/Velankani/RTF/tags/$RTF_Version .
				else
					echo Getting Velankani RTF $HPE_CPE_Version
					svn checkout $SVN_LOCATION/Velankani/RTF/tags/$HPE_CPE_Version .
				fi
				cd ..
	fi
	
	#Getting Hitless
	if [ ! -z $Hitless_Upgrade_Version ]
	then
		echo "Creating Hitless_Upgrade directory"
		mkdir Hitless_Upgrade
			cd Hitless_Upgrade
				if [ $HPE_CPE_Version == "trunk" ]
				then
					echo Getting Velankani Hitless_Upgrade $Hitless_Upgrade_Version
					svn checkout $SVN_LOCATION/Velankani/Hitless_Upgrade/tags/$Hitless_Upgrade_Version .
				else
					echo Getting Velankani Hitless_Upgrade $Hitless_Upgrade_CPE_Version
					svn checkout $SVN_LOCATION/Velankani/Hitless_Upgrade/tags/$HPE_CPE_Version .
				fi
		cd ..
	fi
	
	#Getting Portal
	if [ ! -z $Portal_Version ]
	then
		echo "Creating Portal directory"
		mkdir HPE_Portal
			cd HPE_Portal
				if [ $HPE_CPE_Version == "trunk" ]
				then
					echo Getting Velankani Portal $Portal_Version
					svn checkout $SVN_LOCATION/Velankani/HPE_Portal/tags/$Portal_Version .
				else
					echo Getting Velankani Portal $Portal_Version_CPE_Version
					svn checkout $SVN_LOCATION/Velankani/HPE_Portal/tags/$HPE_CPE_Version .
				fi
		cd ..
	fi
	
	#Getting PCRF-PROXY
	if [ ! -z $PCRF_PROXY_Version ]
	then
		echo "Creating PCRF-PROXY directory"
		mkdir PCRF_PROXY
			cd PCRF_PROXY
				if [ $HPE_CPE_Version == "trunk" ]
				then
					echo Getting Velankani PCRF-PROXY $PCRF_PROXY_Version
					svn checkout $SVN_LOCATION/Velankani/PCRF_PROXY/tags/$PCRF_PROXY_Version .
				else
					echo Getting Velankani PCRF-PROXY $PCRF_PROXY_Version_CPE_Version
					svn checkout $SVN_LOCATION/Velankani/PCRF_PROXY/tags/$HPE_CPE_Version .
				fi
		cd ..
	fi

  #Getting CDRConverter
	if [ ! -z $CDRConverter_Version ]
	then
		echo "Creating CDRConverter directory"
			mkdir CDRConverter
			cd CDRConverter
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Velankani CDRConverter $CDRConverter_Version
					svn checkout $SVN_LOCATION/Velankani/CDRC/tags/$CDRConverter_Version .
				else
					echo Getting Velankani CDRConverter $HPE_Version
					svn checkout $SVN_LOCATION/Velankani/CDRC/tags/$HPE_Version .
				fi
		cd ..
	fi

	cd ..
    return
	
}

#
# Get Tango iAX PCC
#
get_Tango_iAX_PCC ()
{
    choice='y'
    if [ -d Tango ]
    then
        echo "Tango directory already exists."
        echo "Do you want to overwrite (y/n)?-->"
        read choice
			if [ $choice = 'y' ]
			then
				echo "Removing existing Tango directory"
				rm -rf Tango
			else
				echo "returning.."
				return
			fi
    fi
	
    echo "Creating Tango directory"
    mkdir Tango
    cd Tango
    echo "Creating iAX_PCC directory"
		mkdir iAX_PCC
		cd iAX_PCC
			if [ $HPE_Version == "trunk" ]
			then
				echo Getting Tango iAC_PCC $iAX_PCC_Version
				svn checkout $SVN_LOCATION/Tango/iAX_PCC/tags/$iAX_PCC_Version .
			else
				echo Getting Tango iAX_PCC $HPE_Version
				svn checkout $SVN_LOCATION/Tango/iAX_PCC/tags/$HPE_Version .
			fi
    cd ../../
    return
}

#
# Get Juniper Components
#
get_Juniper_Components ()
{
    choice='y'
    if [ -d Juniper ]
    then
        echo "Juniper directory already exists."
        echo "Do you want to overwrite (y/n)?-->"
        read choice
        if [ $choice = 'y' ]
        then
            echo "Removing existing Juniper directory"
            rm -rf Juniper
        else
            echo "returning.."
            return
        fi
    fi
    echo "Creating Juniper directory"
    mkdir Juniper
    cd Juniper
	
		#EX4200 creation
	if [ ! -z $EX4200_Version ]
	then
		echo "Creating EX4200 directory"
			mkdir EX4200
			cd EX4200
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Juniper EX4200 $EX4200_Version
					svn checkout $SVN_LOCATION/Juniper/EX4200/tags/$EX4200_Version .
				else
					echo Getting Juniper EX4200 $HPE_HS_Version
					svn checkout $SVN_LOCATION/Juniper/EX4200/tags/$HPE_Version .
				fi
		 cd ..
	 fi
	 
		#MX480 creation
	if [ ! -z $MX480_Version ]
	then
		echo "Creating MX480 directory"
			mkdir MX480
			cd MX480
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Juniper MX480 $MX480_Version
					svn checkout $SVN_LOCATION/Juniper/MX480/tags/$MX480_Version .
				else
					echo Getting Juniper MX480 $HPE_HS_Version
					svn checkout $SVN_LOCATION/Juniper/MX480/tags/$HPE_Version .
				fi
		cd ..
	fi
	
		#SRX3400 creation
	if [ ! -z $SRX3400 ]
	then
		echo "Creating SRX3400 directory"
			mkdir SRX3400
			cd SRX3400
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Juniper SRX3400 $SRX3400_Version
					svn checkout $SVN_LOCATION/Juniper/SRX3400/tags/$SRX3400_Version .
				else
					echo Getting Juniper SRX3400 $HPE_HS_Version
					svn checkout $SVN_LOCATION/Juniper/SRX3400/tags/$HPE_Version .
				fi
		cd ..
	fi
	
		#MX240 creation
	if [ ! -z $MX240 ]
	then
		echo "Creating MX240 directory"
			mkdir MX240
			cd MX240
				if [ $HPE_Version == "trunk" ]
				then
					echo Getting Juniper SRX3400 $MX240_Version
					svn checkout $SVN_LOCATION/Juniper/MX240/tags/$MX240_Version .
				else
					echo Getting Juniper SRX3400 $HPE_HS_Version
					svn checkout $SVN_LOCATION/Juniper/MX240/tags/$HPE_Version .
				fi
		cd ..
	fi
	
    cd ..
    return
}

#
# Main
#
# Check what version to get
#
if [ $# -eq 0 ]
then
    HPE_CPE_Version="trunk"
else
    HPE_CPE_Version=$1
fi

#
# Get components
#
echo "Getting HPE_HS $HPE_Version"
get_Juniper_Components
get_Velankani_Components
	
#
# Done
#
echo Done!
