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

# make it so we can also access as a system property in the JSP
export JAVA_OPTS="$JAVA_OPTS -Dtransitime.apikey=$(/get_api_key.sh)"

echo JAVA_OPTS $JAVA_OPTS

/usr/local/tomcat/bin/startup.sh

nohup java -Xss12m -Duser.timezone=EST -Dtransitime.configFiles=/usr/local/transitclock/config/transitckockConfig.xml -Dtransitime.core.agencyId=$AGENCYID -Dtransitime.logging.dir=/usr/local/transitclock/logs/ -jar $TRANSITCLOCK_CORE/transitclock/target/Core.jar -configRev 0 > /usr/local/transitclock/logs/output.txt &

tail -f /dev/null
