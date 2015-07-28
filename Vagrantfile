# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # ubuntu 15.04
  config.vm.box = "ubuntu/vivid64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/vivid64"

  # hostname
  config.vm.hostname = "vagrant.ubuntu1504.jp"

  # memory and cpus
  config.vm.provider "virtualbox" do |v|
    v.customize ['modifyvm', :id, '--memory', 1024, '--cpus', 1]
  end

  # private network ip address
  config.vm.network :private_network, ip: "10.10.10.30"

  # sync src
  config.vm.synced_folder "./apps", "/var/apps"

  # provisioning shell
  config.vm.provision :shell, :path => "bootstrap.sh"

  # echo
  config.vm.provision :shell, :inline => <<-CMD
    echo
    echo '######## Next action ########'
    echo '$ sudo -u postgres createuser vagrant -s'
    echo '$ sudo -u postgres psql'
    echo 'postgres=# \password vagrant'
    echo 'postgres=# create database yourdatabase;'
    echo
  CMD

end
