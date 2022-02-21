FROM alpine:edge

# add openssh and clean
RUN apk add --update openssh \
&& rm  -rf /tmp/* /var/cache/apk/*
# add entrypoint script
#ADD entrypoint.sh /usr/local/bin
#RUN chmod 755 /usr/local/bin/entrypoint.sh
#RUN dos2unix /usr/local/bin/entrypoint.sh
#make sure we get fresh keys

COPY sshd_config /etc/ssh/
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa 
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa

RUN adduser foobar -D -s /bin/sh --disabled-password --home /home/foobar
RUN mkdir -p /home/foobar/.ssh

COPY ./ssh/foobar/* /home/foobar/.ssh/
COPY ./ssh/root/* /root/.ssh/

COPY ./ssh/foobar/id_rsa.pub /home/foobar/.ssh/authorized_keys
COPY ./ssh/root/id_rsa.pub /root/.ssh/authorized_keys

RUN chown -R foobar:foobar /home/foobar/.ssh \
    && chmod 700 /home/foobar/.ssh \
    && chmod 600 /home/foobar/.ssh/authorized_keys

#ENTRYPOINT [ "entrypoint.sh" ]
CMD ["/usr/sbin/sshd","-D"]