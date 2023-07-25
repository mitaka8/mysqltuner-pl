FROM perl:latest
RUN apt-get update && apt-get install mariadb-client -y
ADD scripts/mysqltuner.sh /usr/local/bin/mysqltuner.sh

CMD /usr/local/bin/mysqltuner.sh
