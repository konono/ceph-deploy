# -*- mode: ruby -*-
# vi: set ft=ruby :

module SubscriptionManagerMonkeyPatches
  def self.subscription_manager_registered?(machine)
    true if machine.communicate.sudo("/usr/sbin/subscription-manager list --consumed --pool-only | grep -E '^[a-f0-9]{32}$'")
  rescue
    false
  end
end

VagrantPlugins::Registration::Plugin.guest_capability 'redhat', 'subscription_manager_registered?' do
  SubscriptionManagerMonkeyPatches
end

Vagrant.configure("2") do |config|
  config.vm.define :ceph01 do |ceph01|
    ceph01.vm.box = "rhel75"
    ceph01.vm.provider :libvirt do |ceph01|
      ceph01.uri = 'qemu+unix:///system'
      ceph01.cpus = 4
      ceph01.memory = 32921
      ceph01.machine_virtual_size = 50
      ceph01.boot 'hd'
      ceph01.storage :file, :size => '20G'
      ceph01.storage :file, :size => '20G'
      ceph01.storage :file, :size => '20G'
    end

    ceph01.vm.network :public_network,
      ip: "172.16.5.201",
      netmask: "255.255.255.0",
      dev: "storage",
      mode: "bridge",
      type: "bridge"

    ceph01.vm.network :public_network,
      ip: "172.16.6.201",
      netmask: "255.255.255.0",
      dev: "storage_mgmt",
      mode: "bridge",
      type: "bridge"

    ceph01.vm.hostname = "ceph01.lab"
    ceph01.registration.manager = 'subscription_manager'
    ceph01.registration.force = true
    ceph01.registration.username = ''
    ceph01.registration.password = ''
    ceph01.registration.pools = [ '', '' ]
    ceph01.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
      sudo subscription-manager repos --disable=*
      sudo subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms --enable=rhel-ha-for-rhel-7-server-rpms  --enable=rhel-7-server-rhceph-3-osd-rpms --enable=rhel-7-server-rhceph-3-mon-rpms --enable=rhel-7-server-rhceph-3-tools-rpms
      yum -y update
      yum -y install firewalld
      echo root:lab | /usr/sbin/chpasswd
    SHELL
  end

  config.vm.define :ceph02 do |ceph02|
    ceph02.vm.box = "rhel75"
    ceph02.vm.provider :libvirt do |ceph02|
      ceph02.uri = 'qemu+unix:///system'
      ceph02.cpus = 4
      ceph02.memory = 32921
      ceph02.machine_virtual_size = 50
      ceph02.boot 'hd'
      ceph02.storage :file, :size => '20G'
      ceph02.storage :file, :size => '20G'
      ceph02.storage :file, :size => '20G'
    end

    ceph02.vm.network :public_network,
      ip: "172.16.5.202",
      netmask: "255.255.255.0",
      dev: "storage",
      mode: "bridge",
      type: "bridge"

    ceph02.vm.network :public_network,
      ip: "172.16.6.202",
      netmask: "255.255.255.0",
      dev: "storage_mgmt",
      mode: "bridge",
      type: "bridge"

    ceph02.vm.hostname = "ceph02.lab"
    ceph02.registration.manager = 'subscription_manager'
    ceph02.registration.force = true
    ceph02.registration.username = ''
    ceph02.registration.password = ''
    ceph02.registration.pools = [ '', '' ]
    ceph02.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
      sudo subscription-manager repos --disable=*
      sudo subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms --enable=rhel-ha-for-rhel-7-server-rpms  --enable=rhel-7-server-rhceph-3-osd-rpms --enable=rhel-7-server-rhceph-3-mon-rpms --enable=rhel-7-server-rhceph-3-tools-rpms
      yum -y update
      yum -y install firewalld
      echo root:lab | /usr/sbin/chpasswd
    SHELL
  end

  config.vm.define :ceph03 do |ceph03|
    ceph03.vm.box = "rhel75"
    ceph03.vm.provider :libvirt do |ceph03|
      ceph03.uri = 'qemu+unix:///system'
      ceph03.cpus = 4
      ceph03.memory = 32921
      ceph03.machine_virtual_size = 50
      ceph03.boot 'hd'
      ceph03.storage :file, :size => '20G'
      ceph03.storage :file, :size => '20G'
      ceph03.storage :file, :size => '20G'
    end

    ceph03.vm.network :public_network,
      ip: "172.16.5.203",
      netmask: "255.255.255.0",
      dev: "storage",
      mode: "bridge",
      type: "bridge"

    ceph03.vm.network :public_network,
      ip: "172.16.6.203",
      netmask: "255.255.255.0",
      dev: "storage_mgmt",
      mode: "bridge",
      type: "bridge"

    ceph03.vm.hostname = "ceph03.lab"
    ceph03.registration.manager = 'subscription_manager'
    ceph03.registration.force = true
    ceph03.registration.username = ''
    ceph03.registration.password = ''
    ceph03.registration.pools = [ '', '' ]
    ceph03.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
      sudo subscription-manager repos --disable=*
      sudo subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-rh-common-rpms --enable=rhel-ha-for-rhel-7-server-rpms  --enable=rhel-7-server-rhceph-3-osd-rpms --enable=rhel-7-server-rhceph-3-mon-rpms --enable=rhel-7-server-rhceph-3-tools-rpms
      yum -y update
      yum -y install firewalld
      echo root:lab | /usr/sbin/chpasswd
    SHELL
  end

  config.vm.provider :libvirt do |lv|
    lv.uri = 'qemu+unix:///system'
    lv.cpus = 4
    lv.memory = 32921
    lv.boot 'hd'
    lv.management_network_name = "vag-mgmt01"
    lv.management_network_autostart = "ture"
    lv.management_network_address = "192.168.120.0/24"
    lv.management_network_autostart = "ture"
  end
end

