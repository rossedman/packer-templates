#!/bin/bash -eux

yum -y remove ansible python-setuptools
rm -rf /tmp/*
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync