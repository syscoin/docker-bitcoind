Syscoind for Docker
===================

[![Docker Stars](https://img.shields.io/docker/stars/willyko/docker-syscoind.svg)](https://hub.docker.com/r/willyko/docker-syscoind/)
[![Docker Pulls](https://img.shields.io/docker/pulls/willyko/docker-syscoind.svg)](https://hub.docker.com/r/willyko/docker-syscoind/)
[![Build Status](https://travis-ci.org/syscoin/docker-syscoind.svg?branch=master)](https://travis-ci.org/syscoin/docker-syscoind/)
[![ImageLayers](https://images.microbadger.com/badges/image/willyk/syscoind.svg)](https://microbadger.com/#/images/willyk/syscoind)

Docker image that runs the Syscoin syscoind node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. [Vultr](http://bit.ly/1HngXg0), [Digital Ocean](http://bit.ly/18AykdD), KVM or XEN based VMs) running Ubuntu 14.04 or later (*not OpenVZ containers!*)
* At least 5 GB to store the blockchain files (and always growing!)
* At least 1 GB RAM + 2 GB swap file


Really Fast Quick Start
-----------------------

One liner for Ubuntu 14.04 LTS machines with JSON-RPC enabled on localhost and adds upstart init script:

    curl https://raw.githubusercontent.com/syscoin/docker-syscoind/master/bootstrap-host.sh | sh -s trusty


Quick Start
-----------

1. Create a `syscoind-data` volume to persist the syscoind blockchain data, should exit immediately.  The `syscoind-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=syscoind-data
        docker run -v syscoind-data:/syscoin --name=syscoind-node -d \
            -p 8369:8369 \
            -p 127.0.0.1:8370:8370 \
            blockchainfoundryinc/docker-syscoind

2. Verify that the container is running and syscoind node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        d0e1076b2dca        blockchainfoundryinc/docker-syscoind:4.1.2.1     "sys_oneshot"       2 seconds ago       Up 1 seconds        127.0.0.1:8369->8369/tcp, 0.0.0.0:8370->8370/tcp   syscoind-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f syscoind-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* Additional documentation in the [docs folder](docs).
