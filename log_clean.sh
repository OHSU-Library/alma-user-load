/usr/bin/find /home/users/libempdata/scripts/alma_load_users/logs/ -mtime +45 -delete
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/logs/ -mtime +7 -exec gzip -q {} \;
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/logs_dev/ -mtime +45 -delete
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/logs_dev/ -mtime +7 -exec gzip -q {} \;
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/xmls/ -mtime +45 -delete
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/xmls/ -mtime +1 -exec gzip -q {} \;
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/xmls_dev/ -mtime +45 -delete
/usr/bin/find /home/users/libempdata/scripts/alma_load_users/xmls_dev/ -mtime +1 -exec gzip -q {} \;
