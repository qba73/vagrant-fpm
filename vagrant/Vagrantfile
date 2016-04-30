# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/precise64"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
  end
  
  config.vm.provision :shell, path: "install-rvm.sh", args: "stable"
  config.vm.provision :shell, path: "install-ruby.sh", args: "1.9.3"
  config.vm.provision :shell, path: "install-ruby.sh", args: "2.3.0 fpm"
end
