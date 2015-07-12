#!/bin/bash
# Copyright (C) 2015 by yanhong
export PGDATA=/var/lib/postgresql/9.3/main
export BUBASE=/opt/bubase
export BUXLOG=/opt/buxlog
today=`date +%Y-%m-%d.%H:%M:%S`
tar -zcPvf /data0/postgres/psql_base_$today.tar.gz $BUBASE
tar -zcPvf /data0/postgres/psql_xlog_$today.tar.gz $BUXLOG
rm -rf $BUBASE/*
rm -rf $BUXLOG/*
psql -d template1 -c "select PG_START_BACKUP('backup baseline')"
cp -R $PGDATA/* $BUBASE
psql -d template1 -c "select PG_STOP_BACKUP()"
echo "baseline backup success,$today"
