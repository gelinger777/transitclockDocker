#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Start TheTransitClock.'
# This is to substitute into config file the env values

find /usr/local/transitclock/config/ -type f -exec sed -i s#"POSTGRES_PORT_5432_TCP_ADDR"#"$POSTGRES_PORT_5432_TCP_ADDR"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"POSTGRES_PORT_5432_TCP_PORT"#"$POSTGRES_PORT_5432_TCP_PORT"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"PGPASSWORD"#"$PGPASSWORD"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"AGENCYNAME"#"$AGENCYNAME"#g {} \;
find /usr/local/transitclock/config/ -type f -exec sed -i s#"GTFSRTVEHICLEPOSITIONS"#"$GTFSRTVEHICLEPOSITIONS"#g {} \;


rmiregistry &

#set the API as an environment variable so we can set in JSP of template/includes.jsp in the transitime webapp
export APIKEY=$(/get_api_key.sh)

#/usr/local/tomcat/bin/startup.sh;


echo $(/sh/get_api_key.sh);







#java -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml    -Dtransitclock.configFiles="../agency/$AGENCYNAME1.properties"   -Dtransitclock.logging.dir=/tmp   -Dtransitclock.rmi.secondaryRmiPort=0 -jar /usr/local/transitclock/Core.jar


#java -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml   -Dtransitclock.configFiles="../agency/$AGENCYNAME2.properties"    -Dtransitclock.logging.dir=/tmp  -Dtransitclock.rmi.secondaryRmiPort=0   -jar /usr/local/transitclock/Core.jar




export JAVA_OPTS=" -Xmx1024M           -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml    -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/agency-$AGENCYNAME1   -Dhibernate.connection.username=postgres   -Dhibernate.connection.password=$PGPASSWORD                 -Dtransitclock.apikey=$(/sh/get_api_key.sh) -Dtransitclock.configFiles=/usr/local/transitclock/config/halifax.properties -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml"

export CATALINA_OPTS="-Xmx1024M    -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml    -Dhibernate.connection.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR:$POSTGRES_PORT_5432_TCP_PORT/agency-$AGENCYNAME1   -Dhibernate.connection.username=postgres   -Dhibernate.connection.password=$PGPASSWORD      -Dtransitclock.apikey=$(/sh/get_api_key.sh) -Dtransitclock.configFiles=/usr/local/transitclock/config/halifax.properties -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml"




/usr/local/tomcat/bin/startup.sh;

java  -Xss12m   -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml    -Dtransitclock.configFiles="../agency/$AGENCYNAME1.properties"   -Dtransitclock.logging.dir=/tmp   -Dtransitclock.rmi.secondaryRmiPort=0 -jar /usr/local/transitclock/Core.jar


java -Xss12m  -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml   -Dtransitclock.configFiles="../agency/$AGENCYNAME2.properties"    -Dtransitclock.logging.dir=/tmp  -Dtransitclock.rmi.secondaryRmiPort=0   -jar /usr/local/transitclock/Core.jar







tail -f /dev/null
