FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssh-client
COPY ./ssh/root/ /root/.ssh/
RUN useradd -m foobar
RUN mkdir -p /home/foobar/.ssh
COPY ./ssh/foobar/ /home/foobar/.ssh/
RUN chown -R foobar:user /home/foobar/.ssh
RUN echo "Host remotehost\n\tStrictHostKeyChecking no\n" >> /home/user/.ssh/config
USER user
CMD ["/bin/bash"]