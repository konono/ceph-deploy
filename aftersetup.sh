cd ceph-ansible-aftersetup
#!/bin/bash
cd ceph-ansible-presetup
ansible-playbook -i ../hosts ceph.yml
