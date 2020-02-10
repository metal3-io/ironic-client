FROM docker.io/centos:centos8

RUN dnf install -y python3 python3-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/tripleo_repos/main.py | python3 - -b train current && \
    dnf update -y && \
    dnf install -y python3-ironicclient python3-ironic-inspector-client python3-openstackclient && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/*

ENTRYPOINT ["/usr/bin/openstack"]
