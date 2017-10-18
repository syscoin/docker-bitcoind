#!/bin/bash
set -e

testAlias+=(
	[syscoind:trusty]='syscoind'
)

imageTests+=(
	[syscoind]='
		rpcpassword
	'
)
