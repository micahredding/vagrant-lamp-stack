# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do | config |
  # Use our base ubuntu box
  config.vm.box = "ubuntu-precise64"

  # Forward port 8080 on the host to port 80 on the VM
  config.vm.forward_port 80, 8080

  # Provision with chef solo
  config.vm.provision :chef_solo do | chef |
    chef.cookbooks_path = "kitchen/cookbooks"
    chef.roles_path = "kitchen/roles"
    chef.add_role("default")
  end
end
