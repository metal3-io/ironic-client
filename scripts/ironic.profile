REQUESTS_CA_BUNDLE=/proc/1/root/certs/ca/ironic-inspector/ca.crt
OS_AUTH_TYPE=none
OS_ENDPOINT="$(grep 2>/dev/null -A1 service_catalog /proc/1/root/etc/ironic/ironic.conf|tail -1|cut -d\  -f3)"
export REQUESTS_CA_BUNDLE OS_AUTH_TYPE OS_ENDPOINT
