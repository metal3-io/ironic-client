FROM quay.io/centos/centos:stream9

# Help people find the actual baremetal command
COPY scripts/openstack /usr/bin/openstack

RUN dnf install -y python3 python3-pip && \
    pip install python-ironicclient python-ironic-inspector-client --no-cache-dir && \
    chmod +x /usr/bin/openstack && \
    dnf update -y && \
    dnf clean all && \
    rm -rf /var/cache/{yum,dnf}/*

ENTRYPOINT ["/usr/bin/baremetal"]
