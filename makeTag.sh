#!/bin/bash
#
# HPE_HS: Script to create a tagged version in SVN
#
#
# Get the solution configuration information
#
. solution.conf

#
# Tag Juniper EX4200
#
tag_Juniper_EX4200 ()
{
    echo "Tagging Juniper EX4200"
    svn copy $SVN_LOCATION/Juniper/EX4200/tags/$EX4200_Version \
    $SVN_LOCATION/Juniper/EX4200/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Tag Juniper SRX3400
#
tag_Juniper_SRX3400 ()
{
    echo "Tagging Juniper SRX3400"
    svn copy $SVN_LOCATION/Juniper/SRX3400/tags/$SRX3400_Version \
    $SVN_LOCATION/Juniper/SRX3400/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Tag Juniper MX480
#
tag_Juniper_MX480 ()
{
    echo "Tagging Juniper MX480"
    svn copy $SVN_LOCATION/Juniper/MX480/tags/$MX480_Version \
    $SVN_LOCATION/Juniper/MX480/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Tag Velankani Portal
#
tag_Velankani_Portal ()
{
    echo "Tagging Velankani Portal"
    svn copy $SVN_LOCATION/Velankani/HPE_Portal/tags/$Portal_Version \
    $SVN_LOCATION/Velankani/HPE_Portal/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Tag Velankani PCRF-PROXY
#
tag_Velankani_PCRF_PROXY ()
{
    echo "Tagging Velankani PCRF-PROXY"
    svn copy $SVN_LOCATION/Velankani/PCRF_PROXY/tags/$PCRF_PROXY_Version\
    $SVN_LOCATION/Velankani/PCRF_PROXY/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Tag Velankani CDRC
#
tag_Velankani_CDRC ()
{
    echo "Tagging Velankani CDRC"
    svn copy $SVN_LOCATION/Velankani/CDRC/tags/$CDRConverter_Version\
    $SVN_LOCATION/Velankani/CDRC/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Tag Procera PLclient
#
tag_Procera_PLclient ()
{
    echo "Tagging PLclient"
    svn copy $SVN_LOCATION/Procera/PLclient/tags/$PLclient_Version\
    $SVN_LOCATION/Procera/PLclient/tags/$HPE_HS_Version -m "Tagging for HPE_HS Solution $HPE_HS_Version"
    return
}


#
# Tag HPE_HS
#
tag_HPE_HS ()
{
    echo "Tagging HPE_HS"
    svn copy $SVN_LOCATION/HPE/HPE_HS/trunk \
    $SVN_LOCATION/HPE/HPE_HS/tags/$HPE_HS_Version -m "Tagging HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Main
#
#
# Make sure there is a tag specified
#
if [ $# -eq 0 ]
then
    echo "Usage: ./makeTag.sh <Tag>"
    exit 1
else 
    HPE_HS_Version=$1
fi 

#
# Tag components and solution
#

tag_Juniper_EX4200
tag_Juniper_SRX3400
tag_Juniper_MX480
tag_Velankani_Portal
tag_Velankani_PCRF_PROXY
tag_Velankani_CDRC
tag_Procera_PLclient
tag_HPE_HS

#
# Done
#
echo Done!

