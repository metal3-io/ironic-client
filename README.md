# Metal3 Ironic Client Container

This repo contains the files needed to build a container image with the Ironic
CLI utilities, which are useful for debugging via Ironic APIs.

## Description

When updated, builds are automatically triggered on
[Quay](https://quay.io/repository/metal3-io/ironic-client).


Metal3 Baremetal Operator Debugging
-----------------------------------

The container image can be used to debug the Ironic component of Metal3.

Once a baremetal-operator-ironic container is running, the
Metal 3 Ironic Client Container container can be
started as a debug container using the following command line:

```sh
kubectl debug -it $(kubectl get -n baremetal-operator-system pods -l name=baremetal-operator-ironic -o name) --image=quay.io/metal3-io/ironic-client --target ironic -n baremetal-operator-system
```

This opens an interactive baremetal cli witin the debug container.

The default authentication type used is "none".
You may override it, e.g. when using `http_basic`, by
passing the `--env` parameter to the `kubectl debug` call:

```
--env OS_AUTH_TYPE=http_basic,OS_ENDPOINT=http://localhost:1234,OS_USERNAME=foo,OS_PASSWORD=bar
```

The baremetal command can be used to access the
Python Ironic Client Standalone CLI e.g. one can use

```sh
baremetal node list
```

to list all nodes and their states registered in Ironic.
