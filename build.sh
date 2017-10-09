#!/bin/bash
# give --no-cache as parameter if you want to force rebuild
BASE=$(pwd)
docker build $1 -t mega2iec .
docker run -v $BASE/flash2560:/flash -t mega2iec
