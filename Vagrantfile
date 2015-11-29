# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.5.0'

# Configure Network Ports
def configure_network_ports(config)
  if ARGV[0]=="help" then
    return
  else
    config.vm.network :public_network
    config.vm.network :private_network, ip: "10.10.10.5"
    config.vm.network "forwarded_port", guest: 80, host: 8080 # HTTP port
    config.vm.network "forwarded_port", guest: 3306, host: 5005 # MySQL port
    config.vm.network "forwarded_port", guest: 5000, host: 5000 # Our angular app
    config.vm.network "forwarded_port", guest: 5001, host: 5001 # Our django API
    config.vm.network "forwarded_port", guest: 80, host: 5002 # Our django API
    config.vm.network "forwarded_port", guest: 35729, host: 35729 # Browsersync
  end
end

# Our main privisioning loop
def provision(config)
  # Run the chef provisioner
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      mysql: {
        server_root_password: 'rootpass',
        server_debian_password: 'debpass',
        server_repl_password: 'replpass'
      }
    }

    chef.run_list = [
      'recipe[maadbox::default]'
    ]
  end

  # Copy necessary files to box
  config.vm.provision :file, source: 'provision', destination: "/tmp/provision"
  config.vm.provision :file, source: 'bin_files', destination: "/tmp/bin"

  # Call our provisioner shell script
  config.vm.provision "shell", path: "provision/setup.sh", keep_color: true
end


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = 'maadbox'

  # Set the version of chef to install using the vagrant-omnibus plugin
  # NOTE: You will need to install the vagrant-omnibus plugin:
  #
  #   $ vagrant plugin install vagrant-omnibus
  #
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  # Every Vagrant virtual environment requires a box to build off of.
  # If this value is a shorthand to a box in Vagrant Cloud then
  # config.vm.box_url doesn't need to be specified.
  config.vm.box = 'ubuntu/trusty64'

  # Allow ssh agent forwarding (so we can use github)
  # config.ssh.private_key_path = '~/.ssh/id_rsa'
  config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # NOTE: If you're dealing with a lot of files it's better to use
  # something like SSHFS to access your files on your host machine
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false # Set to true if you're having boot issues

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.memory = "2048" # Set to 1024 if you have <4Gb RAM
  end

  # View the documentation for the provider you're using for more
  # information on available options.

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  # Set up any port forwarding that we need
  configure_network_ports(config)

  # Call our main provisioning loop
  provision(config)

end
