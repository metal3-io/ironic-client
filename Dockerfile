FROM docker.io/centos:centos8

# Help people find the actual baremetal command
COPY scripts/openstack /usr/bin/openstack

RUN dnf install -y python3 python3-requests && \
    curl https://raw.githubusercontent.com/openstack/tripleo-repos/master/tripleo_repos/main.py | python3 - -b master current-tripleo && \
    dnf update -y --setopt=install_weak_deps=False && \
    dnf install -y --setopt=install_weak_deps=False python3-ironicclient python3-ironic-inspector-client && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/* && \
    chmod +x /usr/bin/openstack

ENTRYPOINT ["/usr/bin/baremetal"]
