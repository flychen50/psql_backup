test -d /data0/postgres ||mkdir -p /data0/postgres
test -d /opt/bubase ||mkdir -p /opt/bubase
test -d /opt/buxlog||mkdir -p /opt/buxlog
chmod 777 /data0/postgres
chmod 777 /opt/bubase
chmod 777 /opt/buxlog
cp base.sh /data0/postgres
cp xlog.sh /data0/postgres
cp psql_backup_cron /etc/cron.d/psql_backup_cron
