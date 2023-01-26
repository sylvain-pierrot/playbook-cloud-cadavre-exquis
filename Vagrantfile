Vagrant.configure("2") do |config|
  config.env.enable # Enable vagrant-env(.env)

  config.vm.define "node-1-master", primary: true do |subconfig|
    # Configure Master
    subconfig.vm.provider :libvirt do |libvirt|
      libvirt.cpus = 2
      libvirt.memory = 2048
      libvirt.machine_virtual_size = 20
    end
    subconfig.vm.box = ENV['BOX_IMAGE']
    subconfig.vm.hostname = "node-1-master"
    subconfig.vm.network :private_network, ip: "192.168.50.10", netmask: "255.255.255.0"

  end

  # Number of VMs Worker
  (2..ENV['NODE_COUNT'].to_i).each do |i|
    config.vm.define "node-#{i}-worker" do |subconfig|
      # Configure Worker
      subconfig.vm.provider :libvirt do |libvirt|
        libvirt.cpus = 2
        libvirt.memory = 2048
        libvirt.machine_virtual_size = 20
      end
      subconfig.vm.box = ENV['BOX_IMAGE']
      subconfig.vm.hostname = "node-#{i}-worker"
      subconfig.vm.network :private_network, ip: "192.168.50.#{i + 10}", netmask: "255.255.255.0"
      
    end
  end
end
