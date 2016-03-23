#!/bin/bash
#
# HPE_HS: Script to create a release version in SVN
#
#
# Get the solution configuration information
#
. solution.conf

#
# Release HPE_HS
#
release_HPE_HS ()
{
    echo "Releasing HPE_HS"
    svn copy $SVN_LOCATION/HPE/HPE_HS/tags/$HPE_HS_Version \
    $SVN_LOCATION/HPE/HPE_HS/releases/$HPE_HS_Version -m "Releasing HPE_HS Solution $HPE_HS_Version"
    return
}

#
# Main
#
#
# Make sure there is a release tag specified
#
if [ $# -eq 0 ]
then
    echo "Usage: ./makeiRelease.sh <Release Tag>"
    exit 1
else 
    HPE_HS_Version=$1
fi 

#
# Release solution
#
release_HPE_HS

#
# Done
#
echo Done!

