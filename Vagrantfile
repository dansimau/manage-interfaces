# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Boot with a GUI so you can see the screen. When you're messing with network
  # interfaces, this is important.
  config.vm.boot_mode = :gui

  # Add some interfaces
  config.vm.network :hostonly, "172.16.10.2"
  config.vm.network :hostonly, "172.16.20.2"
  config.vm.network :hostonly, "172.16.30.2"
  config.vm.network :hostonly, "172.16.40.2"

  # Update apt
  #config.vm.provision :shell, :inline => "aptitude -q2 update"

end
