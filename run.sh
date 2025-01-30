#!/bin/sh
docker build -t linux-tkg .
docker run --rm -it -v $(pwd)/DEBS/:/usr/local/src/linux-tkg/DEBS/ linux-tkg