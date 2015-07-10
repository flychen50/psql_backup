#!/bin/bash
# Copyright (C) 2015 by yanhong
export PGDATA=/var/lib/postgresql/9.3/main
export BUBASE=/opt/bubase
export BUXLOG=/opt/buxlog
today=`date +%Y-%m-%d.%H:%M:%S`
cp -R $PGDATA/pg_xlog/* $BUXLOG
echo "xlog backup,$today"
