#!/bin/bash
set -e

# Generate the password the first time
sys_init 2>/dev/null
eval `grep rpcpassword $HOME/.syscoin/syscoin.conf`
rpcpassword1=$rpcpassword

# Generate the password again
rm ~/.syscoin/syscoin.conf
sys_init 2>/dev/null
eval `grep rpcpassword $HOME/.syscoin/syscoin.conf`
rpcpassword2=$rpcpassword


# Check that password looks like a auto-generated base64 random value or better
if [ ${#rpcpassword} -lt 16 ]; then
    echo "FAIL: RPC Password does not appear long enough" >&2
    exit 1
fi

# Check that each password was at least different
if [ "$rpcpassword1" = "$rpcpassword2" ]; then
    echo "FAIL: RPC Password does not appear to be random" >&2
    exit 2
fi
