#  要对数据库执行实时备份首先需要在配置文件中打开相关配置
postgresql.conf 文件, 设置如下:
archive_mode = on
archive_command = 'cp %p /opt/buxlog/%f' ///opt/buxlog为增量备份的目录

#  执行install.sh安装备份程序
已root用户执行

#  恢复数据库
关闭数据库
su postgres
cd /data0/postgres/
/etc/init.d/postgresql stop
rm -rf   /var/lib/postgresql/9.3/main
cp -R /opt/bubase/* .
recovery.conf 改一行, 如下:
restore_command='cp /opt/buxlog/%f %p'
如果需要恢复到特定时间点则，另外增加一行
recovery_target_time = '2012-10-31 11:41:50 ' //指定归档时间点，如没指定恢复到故障前的最后一完成的事务
cp  recovery.conf /var/lib/postgresql/9.3/main/recovery.conf
/etc/init.d/postgresql start
