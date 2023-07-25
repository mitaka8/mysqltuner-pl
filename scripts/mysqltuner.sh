#!/bin/bash

wget https://raw.githubusercontent.com/major/MySQLTuner-perl/master/mysqltuner.pl -O /tmp/mysqltuner.pl
perl /tmp/mysqltuner.pl --host "$DB_HOST" --user "$DB_USER" --pass "$DB_PASS"

