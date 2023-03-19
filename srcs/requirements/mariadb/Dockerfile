FROM    debian:buster

RUN     apt-get update && apt-get update -y
RUN     apt-get install -y \
        mariadb-server \
        procps \
        vim

COPY    ./tool/mariadb_setup.sh /mariadb_setup.sh

# 127.0.0.1 은 콜백 함수로서, 외부에서 접근할 수 없다. 127.0.0.1 로 root / pw 설정, # anywhere ipv4 로 설정

RUN     sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE  3306

CMD     ["/bin/bash", "/mariadb_setup.sh"]