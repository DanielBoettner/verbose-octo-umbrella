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

RUN adduser foobar -D -s /bin/sh --home /home/foobar
RUN mkdir -p /home/foobar/.ssh

COPY ./ssh/foobar/ /home/foobar/.ssh/
COPY ./ssh/root/ /root/.ssh/

EXPOSE 22

#ENTRYPOINT [ "entrypoint.sh" ]
CMD ["/usr/sbin/sshd","-D"]