FROM ubuntu:latest
COPY build.sh /
COPY sshd_init /etc/rc.d/init.d/sshd
COPY sshd.service /etc/systemd/system/sshd.service
RUN chmod +x /build.sh && /build.sh 2>/dev/null
RUN mkdir -p /etc/rc.d/init.d
RUN chmod +x /etc/rc.d/init.d/sshd
RUN chmod +x /etc/systemd/system/sshd.service
RUN useradd -m n00b -s /bin/bash
RUN echo "AllowUsers n00b" >> /usr/local/etc/sshd_config
RUN echo "n00b:password" | chpasswd
RUN rm -rf /build*
CMD systemctl start sshd; /bin/bash -l
