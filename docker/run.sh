#!/usr/bin/env bash
docker rm -f isva-ansible
docker run -it --rm --name isva-ansible \
    -v /home/master/automation/inventory:/ansible/inventory \
    --add-host=isva-1.ibm.com:192.168.42.110 \
    --add-host=isva-2.ibm.com:192.168.42.120 \
    --add-host=isva-3.ibm.com:192.168.42.130 \
    isva-ansible

