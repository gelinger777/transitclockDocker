export PGPASSWORD=transitclock

docker stop transitclock-db
docker stop transitclock-server-instance

docker rm transitclock-db
docker rm transitclock-server-instance

#docker rmi transitclock-server

docker build -t transitclock-server \
--build-arg TRANSITCLOCK_GITHUB="https://github.com/TheTransitClock/transitime.git" \
--build-arg TRANSITCLOCK_BRANCH="develop" \
--build-arg AGENCYNAME1=halifax \
--build-arg AGENCYNAME2=tampta \
--build-arg GTFS_URL1="http://gtfs.halifax.ca/static/google_transit.zip" \
--build-arg GTFS_URL2="http://www.gohart.org/google/google_transit.zip" \
--build-arg GTFSRTVEHICLEPOSITIONS1="http://realtime.prod.obahart.org:8088/vehicle-positions" \
--build-arg GTFSRTVEHICLEPOSITIONS1="http://api.tampa.onebusaway.org:8088/vehicle-positions" .

docker run --name transitclock-db -p 5432:5432 -e POSTGRES_PASSWORD=$PGPASSWORD -d postgres:9.6.3

docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./sh/check_db_up.sh

docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./sh/create_tables.sh

docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./sh/import_gtfs.sh

docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./sh/create_api_key.sh

docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./sh/create_webagency.sh

#docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./import_avl.sh

#docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD transitclock-server ./process_avl.sh

docker run --name transitclock-server-instance --rm --link transitclock-db:postgres -e PGPASSWORD=$PGPASSWORD  -p 8080:8080 transitclock-server  ./sh/start_transitime.sh
