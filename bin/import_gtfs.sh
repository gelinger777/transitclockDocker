#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Import GTFS file.'
# This is to substitute into config file the env values.



echo "REPLACE VARIABLES" 





echo "IMPORTING $AGENCYNAME1  $GTFS_URL1";



java   -Dtransitclock.logging.dir=/tmp   -cp /usr/local/transitclock/Core.jar org.transitclock.applications.GtfsFileProcessor   -c "../agency/$AGENCYNAME1.properties"   -storeNewRevs   -skipDeleteRevs   -gtfsUrl $GTFS_URL1   -maxTravelTimeSegmentLength 100







echo "IMPORTING $AGENCYNAME2 $GTFS_URL2";


java   -Dtransitclock.logging.dir=/tmp   -cp /usr/local/transitclock/Core.jar org.transitclock.applications.GtfsFileProcessor   -c "../agency/$AGENCYNAME2.properties"   -storeNewRevs   -skipDeleteRevs   -gtfsUrl $GTFS_URL2   -maxTravelTimeSegmentLength 100

