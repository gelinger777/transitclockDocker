#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Start TheTransitClock.'
# This is to substitute into config file the env values

rmiregistry &

#set the API as an environment variable so we can set in JSP of template/includes.jsp in the transitime webapp
#export APIKEY=$(/get_api_key.sh)

/usr/local/tomcat/bin/startup.sh;

#nohup java -Xss12m -Duser.timezone=EST -Dtransitime.configFiles=/usr/local/transitclock/config/transitckockConfig.xml -Dtransitime.core.agencyId=$AGENCYID -Dtransitime.logging.dir=/usr/local/transitclock/logs/ -jar $TRANSITCLOCK_CORE/transitclock/target/Core.jar -configRev 0 > /usr/local/transitclock/logs/output.txt &

echo $(/sh/get_api_key.sh);


export JAVA_OPTS="-Dtransitclock.apikey=$(/sh/get_api_key.sh) -Dtransitclock.configFiles=/usr/local/transitclock/config/halifax.properties -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml"

export CATALINA_OPTS="-Dtransitclock.apikey=$(/sh/get_api_key.sh) -Dtransitclock.configFiles=/usr/local/transitclock/config/halifax.properties -Dtransitclock.hibernate.configFile=/usr/local/transitclock/config/hibernate.cfg.xml"









tail -f /dev/null
