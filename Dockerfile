FROM quay.io/centos/centos:stream9

# Help people find the actual baremetal command
COPY scripts/openstack /usr/bin/openstack

COPY scripts/ironic.profile /etc/profile.d/ironic.sh

RUN dnf install -y python3 python3-pip && \
    pip install python-ironicclient --prefix /usr --no-cache-dir && \
    chmod +x /usr/bin/openstack && \
    dnf update -y && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/*

ENTRYPOINT ["bash", "-lc", "/usr/bin/baremetal"]
