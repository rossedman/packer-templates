#!/bin/bash -eux

rpm -ivh http://mirror.pnl.gov/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum install -y python-setuptools python-simplejson ansible