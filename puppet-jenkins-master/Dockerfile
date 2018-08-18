FROM centos:6.9

LABEL maintainer="Bruno Conrado Santos"
LABEL name="Puppet Jenkins Master"
LABEL server-name="master.jenkins-test.com.br"
LABEL description="A Docker file to configure an jenkins master with puppet client"
LABEL version="0.1"

COPY config/repo/puppet.repo /etc/yum.repos.d/ 

RUN yum clean all && yum install -y puppet-agent

VOLUME [ "/vol/shared" ]

EXPOSE 22 8080

EXPOSE 8140

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "ps aux | grep puppet | grep" ]

CMD /etc/init.d/puppet start && /bin/bash