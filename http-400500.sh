TNAME=`mysql -uroot -p123456 ipm -e 'select *from http_log_tables order by table_id desc limit 1;' | grep 0000 | awk '{print $1}'`
TNAME="http_log_"$TNAME

echo $TNAME

mysql -uroot -p123456 ipm -e "update $TNAME set httpreturncode=404 where id%5=0;"
mysql -uroot -p123456 ipm -e "update $TNAME set httpreturncode=500 where id%7=0;"
