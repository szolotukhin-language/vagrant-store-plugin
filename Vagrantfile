# -*- mode: ruby -*-
# vi: set ft=ruby :

# unless Vagrant.has_plugin?("vagrant-persistent-storage")
#   abort 'The Vagrant vagrant-persistent-storage plugin must be install prior to building this VM (vagrant plugin install vagrant-persistent-storage)'
# end

# disk = './.vagrant/persistence-disk-01.vdi'

Vagrant.configure("2") do |config|
  # Ubuntu 20.04.3 LTS - Focal Fossa
  # config.vm.box = "ubuntu/focal64"
  # Ubuntu 22.04.2 LTS - Jammy Jellyfish
  config.vm.box = "ubuntu/jammy64"

  config.vm.provider :virtualbox do |vb|
    vb.name = "multiple-disks-2"
    vb.memory = "2048"
    vb.cpus = 2
    vb.gui = true
  end

  config.vm.synced_folder ".", "/vagrant"
  config.vm.provision :szshell, args: "Hello Serhij Zolotukhin"
end