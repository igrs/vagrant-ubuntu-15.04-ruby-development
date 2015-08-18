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
    v.customize [
      'modifyvm', :id,
      '--memory', 1024,
      '--cpus', 1,
      '--paravirtprovider', 'kvm',]
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
    echo '------ set password ------'
    echo 'postgres=# create database yourdatabase;'
    echo '######## Japanaize ########'
    echo '$ sudo apt-get install -y language-pack-ja'
    echo '$ sudo update-locale LANGUAGE=ja_JP.utf-8 LANG=ja_JP.utf-8 LC_ALL=ja_JP.utf-8'
    echo '$ sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime'
    echo '------ and restart vm ------'
    echo
  CMD

end
