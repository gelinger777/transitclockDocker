#!/usr/bin/env bash
echo 'THETRANSITCLOCK DOCKER: Connecting to database.'
psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_POST_5432_TCP_PORT" -U postgres -d agency-$AGENCYNAME1

#psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_POST_5432_TCP_PORT" -U postgres -d $AGENCYNAME2
