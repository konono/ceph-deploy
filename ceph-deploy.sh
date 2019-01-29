#!/bin/bash
cd ceph-ansible
ansible-playbook -i ./hosts ./ceph-ansible/site.yml 
