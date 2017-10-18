# Debugging

## Things to Check

* RAM utilization -- syscoind is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The syscoin blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 40GB+ is necessary.

## Viewing syscoind Logs

    docker logs syscoind-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the syscoind node, but will not connect to already running containers or processes.

    docker run -v syscoind-data:/syscoin --rm -it willyko/syscoind bash -l

You can also attach bash into running container to debug running syscoind

    docker exec -it syscoind-node bash -l


