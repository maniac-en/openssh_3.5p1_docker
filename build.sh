#!/bin/bash
apt-get update && apt-get -y upgrade && \
	echo "sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin" >> /etc/passwd && \
	echo "sshd:x:74:" >> /etc/group && \
	apt-get install -y wget gcc make systemctl && \
    mkdir build && cd build && \
	wget ftp://ftp3.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-3.5p1.tar.gz && \
	wget https://zlib.net/fossils/zlib-1.1.4.tar.gz && \
	wget https://www.openssl.org/source/old/0.9.x/openssl-0.9.7a.tar.gz && \
    cat *.tar.gz | tar -zxvf - -i && \
	cd zlib-1.1.4 && ./configure && make install && \
    cd ../openssl-0.9.7a && ./config && make install && \
    cd ../openssh-3.5p1 && \
	sed -i 's/defined//g' fixpaths && \
	sed -i "32,44 {s/^/\/\* /;s/$/ \*\//}" openbsd-compat/bsd-getpeereid.c && \
	sed -i "830,835 {s/^/\/\* /;s/$/ \*\//}" ssh-agent.c && \
	./configure --with-ipv4-default --with-md5-passwords && make install
