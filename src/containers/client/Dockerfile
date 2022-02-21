FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y openssh-client iputils-ping
COPY ./ssh/root/* /root/.ssh/
RUN useradd -m foobar && groupadd user
RUN mkdir -p /home/foobar/.ssh
COPY ./ssh/foobar/* /home/foobar/.ssh/

RUN chown -R foobar:foobar /home/foobar/.ssh \
    && chmod 700 /home/foobar/.ssh

RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/foobar/.ssh/config

USER foobar
WORKDIR /home/foobar
CMD ["/bin/bash"]