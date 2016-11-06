#!/bin/bash
WORKDIR="$PWD/bin"
mkdir -pv $WORKDIR
docker pull zoobab/uboot-pine64:latest
docker run -v $WORKDIR:/mnt uboot-pine64:latest cp -v /home/pine64/output/pine64.img /mnt
