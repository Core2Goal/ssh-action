FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y openssh-client sshpass

RUN mkdir -p /root/action/
COPY entrypoint.sh /root/action/entrypoint.sh
RUN chmod +x /root/action/entrypoint.sh

ENTRYPOINT ["/root/action/entrypoint.sh"]
