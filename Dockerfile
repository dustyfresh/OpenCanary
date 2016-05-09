FROM debian:jessie
MAINTAINER dustyfresh, https://github.com/dustyfresh

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install --yes sudo vim build-essential tcpdump libpcap-dev \
 libssl-dev python-dev python-setuptools python-pip python-virtualenv supervisor

RUN mkdir -p /opt/opencanary &&  virtualenv -p python /opt/opencanary/virtualenv \
  && source /opt/opencanary/virtualenv/bin/activate \
  && pip install opencanary \
  && pip install scapy pcapy

ADD conf/opencanary.conf /root/.opencanary.conf
ADD conf/supervise-opencanary.conf /etc/supervisor/conf.d/supervise-opencanary.conf

RUN mkdir -p /opt/opencanary/scripts
ADD scripts/startcanary.sh /opt/opencanary/scripts/startcanary.sh
RUN chmod +x /opt/opencanary/scripts/startcanary.sh

CMD ["/usr/bin/supervisord", "-n"]
