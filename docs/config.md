syscoind config tuning
======================

You can use environment variables to customize config ([see docker run environment options](https://docs.docker.com/engine/reference/run/#/env-environment-variables)):

        docker run -v syscoind-data:/syscoin --name=syscoind-node -d \
            -p 8333:8333 \
            -p 127.0.0.1:8332:8332 \
            -e DISABLEWALLET=1 \
            -e PRINTTOCONSOLE=1 \
            -e RPCUSER=mysecretrpcuser \
            -e RPCPASSWORD=mysecretrpcpassword \
            willyko/syscoind

Or you can use your very own config file like that:

        docker run -v syscoind-data:/syscoin --name=syscoind-node -d \
            -p 8333:8333 \
            -p 127.0.0.1:8332:8332 \
            -v /etc/mysyscoin.conf:/syscoin/.syscoin/syscoin.conf \
            willyko/syscoind
