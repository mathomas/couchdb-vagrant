# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.55.55"
  config.vm.provision "shell", 
                      path: "provision.sh",
                      env: {
                      }

  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 2 
  end
end

