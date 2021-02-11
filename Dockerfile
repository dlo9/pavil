FROM alpine

RUN apk add salt-master salt-minion py3-pip
RUN pip install libnacl

RUN mkdir -p /etc/salt/master.d /srv/salt /etc/salt/pki/master

EXPOSE 4505
EXPOSE 4506
ENTRYPOINT salt-master -l debug
