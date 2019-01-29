# How to deploy Ceph

## 1. Create VMs

```
git clone https://github.com/konono/ceph-deploy.git

cd ceph-deploy.git

vagrant up
```

## 2. Configure Inventory

```
vim hosts
[mons]
ceph-mon001 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.201
ceph-mon002 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.202
ceph-mon003 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.203

[osds]
ceph-osd001 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.201
ceph-osd002 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.202
ceph-osd003 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.203

[mgrs]
ceph-mgrs001 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.201
ceph-mgrs002 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.202
ceph-mgrs003 ansible_ssh_user='root' ansible_ssh_pass='lab' ansible_sudo_pass='lab' ansible_ssh_host=172.16.5.203
```

## 3. Run presetup.sh

```
./presetup.sh
```

## 4. Run ceph-deploy.sh

```
./cat ceph-deploy.sh

```

## 5. Run aftersetup.sh

```
./aftersetup.sh
```

