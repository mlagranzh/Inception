FROM debian:buster

ARG DB_NAME 
ARG DB_USER
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD 

RUN apt update && apt install mariadb-server -y

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/
COPY createdb.sql /
COPY file.sql /
COPY edit-env.sh ./

RUN bash ./edit-env.sh

RUN service mysql start && mysql < createdb.sql \
&& mysql -u root -p"$DB_ROOT_PASSWORD" wordpress < file.sql 

EXPOSE 3306

CMD /usr/bin/mysqld_safe