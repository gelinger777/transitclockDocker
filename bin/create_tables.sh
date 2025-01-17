#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Create Tables'
createdb -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres agency-$AGENCYNAME1

psql \
	-h "$POSTGRES_PORT_5432_TCP_ADDR" \
	-p "$POSTGRES_PORT_5432_TCP_PORT" \
	-U postgres \
	-d agency-$AGENCYNAME1 \
	-f /usr/local/transitclock/db/ddl_postgres_org_transitime_db_structs.sql;

psql \
	-h "$POSTGRES_PORT_5432_TCP_ADDR" \
	-p "$POSTGRES_PORT_5432_TCP_PORT" \
	-U postgres \
	-d agency-$AGENCYNAME1 \
	-f /usr/local/transitclock/db/ddl_postgres_org_transitime_db_webstructs.sql;





createdb -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres agency-$AGENCYNAME2;



psql \
	-h "$POSTGRES_PORT_5432_TCP_ADDR" \
	-p "$POSTGRES_PORT_5432_TCP_PORT" \
	-U postgres \
	-d agency-$AGENCYNAME2 \
	-f /usr/local/transitclock/db/ddl_postgres_org_transitime_db_structs.sql;
psql \
        -h "$POSTGRES_PORT_5432_TCP_ADDR" \
        -p "$POSTGRES_PORT_5432_TCP_PORT" \
        -U postgres \
        -d agency-$AGENCYNAME2 \
        -f /usr/local/transitclock/db/ddl_postgres_org_transitime_db_webstructs.sql


