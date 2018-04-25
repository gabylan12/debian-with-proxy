# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

#  print "Enter proxy: "
#  sites_repo_path = STDIN.gets.chomp
#  print "\n"

   config.vm.network "forwarded_port", guest: 80, host: 1024
   config.vm.network "forwarded_port", guest: 3306, host: 3306

   config.vm.provider "virtualbox" do |vb|
     vb.memory = "256"
   end

  config.vm.provision "shell", inline: <<-SHELL
   echo "export http_proxy=http://10.33.13.66:3129" >> /etc/profile
   sudo useradd -u 12345 -g sudo -d /home/php -s /bin/bash -p $(echo php | openssl passwd -1 -stdin) php
   sudo touch /etc/apt/apt.conf.d/30proxy
   echo 'Acquire::http::Proxy "http://10.33.13.66:3129/";' >> /etc/apt/apt.conf.d/30proxy
  SHELL
end
