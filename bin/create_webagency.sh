#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Create WebAgency.'
# This is to substitute into config file the env values


echo "java   -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/agency-$AGENCYNAME1   -Dhibernate.connection.username=postgres   -Dhibernate.connection.password=$PGPASSWORD   -cp /usr/local/transitclock/Core.jar org.transitclock.db.webstructs.WebAgency   $AGENCY1   127.0.0.1   agency-$AGENCYNAME1   postgresql   $POSTGRES_PORT_5432_TCP_ADDR   postgres   $PGPASSWORD"
java   -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/agency-$AGENCYNAME1   -Dhibernate.connection.username=postgres   -Dhibernate.connection.password=$PGPASSWORD   -cp /usr/local/transitclock/Core.jar org.transitclock.db.webstructs.WebAgency   $AGENCYNAME1   127.0.0.1   agency-$AGENCYNAME1   postgresql   $POSTGRES_PORT_5432_TCP_ADDR   postgres   $PGPASSWORD




echo "java   -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/agency-$AGENCYNAME1   -Dhibernate.connection.username=postgres   -Dhibernate.connection.password=$PGPASSWORD   -cp /usr/local/transitclock/Core.jar org.transitclock.db.webstructs.WebAgency   $AGENCYNAME2   127.0.0.1   agency-$AGENCYNAME1   postgresql   $POSTGRES_PORT_5432_TCP_ADDR   postgres   $PGPASSWORD"
java   -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/agency-$AGENCYNAME1   -Dhibernate.connection.username=postgres   -Dhibernate.connection.password=$PGPASSWORD   -cp /usr/local/transitclock/Core.jar org.transitclock.db.webstructs.WebAgency   $AGENCYNAME2   127.0.0.1   agency-$AGENCYNAME1   postgresql   $POSTGRES_PORT_5432_TCP_ADDR   postgres   $PGPASSWORD

