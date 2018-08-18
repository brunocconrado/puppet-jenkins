FROM centos:6.9

LABEL maintainer="Bruno Conrado Santos"
LABEL name="Puppet master"
LABEL server-name="master.puppet-test.com.br"
LABEL description="A Docker file to configure an puppet master with some .app files to use puppet client and jenkins master/slave"
LABEL version="0.1"

COPY config/repo/puppet.repo /etc/yum.repos.d/
#COPY config/repo/RPM-GPG-KEY-puppet /etc/pki/rpm-gpg/

RUN yum clean all && yum install -y puppetserver

RUN ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet

RUN puppet module install maestrodev-wget --version 1.7.3 && \
    puppet module install stschulte-rpmkey --version 1.0.3

RUN chkconfig --add puppet && chkconfig puppet on
RUN chkconfig --add puppetserver && chkconfig puppetserver on

COPY config/*.conf /etc/puppetlabs/puppet/
COPY config/manifests/*.pp /etc/puppetlabs/code/environments/production/manifests/
COPY config/docker-entrypoint.sh /usr/bin/

RUN chmod 755 /usr/bin/docker-entrypoint.sh
#RUN docker-entrypoint.sh

VOLUME [ "/vol/shared" ]

EXPOSE 8140

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "ps aux | grep puppet | grep" ]

CMD /etc/init.d/puppetserver start && /bin/bash