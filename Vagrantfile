# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "puppetlabs/centos-6.6-64-puppet"
  config.vm.box_version = "1.0.1"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.22.9"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "/apps/git/drum-env", "/apps/drum/drum-env"
  config.vm.synced_folder "/apps/git/drum/dspace/target/dspace-installer", "/apps/drum/dspace-installer"
  if Dir["/apps/git/solr-env"] != nil
    config.vm.synced_folder "/apps/git/solr-env", "/apps/solr-env-sync"
  end
  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.provision "shell", path: 'scripts/bootstrap.sh'
  config.vm.provision "shell", path: 'scripts/update-solr-env.sh'
  config.vm.provision "puppet"
end
