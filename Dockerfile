FROM phusion/baseimage:0.9.19
MAINTAINER Radek Slavicinsky "radek@blufor.cz"
ENV ETCD_VERSION "3.0.3"
ADD tools/* /bin/
RUN rm /bin/sh \
  && ln -s /bin/bash /bin/sh \
  && rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh \
  && touch /etc/service/cron/down \
  && DEBIAN_FRONTEND=noninteractive apt-get -q update \
  && apt-get -qy install unzip ruby ruby-dev make git wget \
  && gem install etcd-tools port-authority --no-rdoc --no-ri \
  && wget https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz -O- | tar xvzC /tmp \
  && cp /tmp/etcd-v${ETCD_VERSION}-linux-amd64/etcdctl /bin/ \
  && cleanup
CMD [ "/bin/bash" ]
