#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Create API key.'
# This is to substitute into config file the env values

echo " IMPORT $AGENCYNAME1"

java   -cp /usr/local/transitclock/Core.jar org.transitclock.applications.CreateAPIKey   -c  "../agency/$AGENCYNAME1.properties"   -n "Kris Appleseed"   -u "https://www.google.com"   -e "info2@example.com"   -p "123123123123123"   -d "Core access application" 




#echo " IMPORT $AGENCYNAME2"



java   -cp /usr/local/transitclock/Core.jar org.transitclock.applications.CreateAPIKey   -c "../agency/$AGENCYNAME2.properties"  -n "Kris Appleseed"    -u "https://www.google.com"   -e "info@example.com"   -p "123123123123"   -d "Core access application"
