Vagrant.configure(2) do |config|
  config.vm.synced_folder ".", "/vagrant", disabled: true
  # config.vm.box = "obsd57" 
  config.vm.box = "tmatilai/openbsd-5.6"

  config.vm.define "r1" do |config|
    config.vm.hostname = "r1"
    config.vm.guest = :openbsd
    config.vm.network "private_network", :ip => "10.20.1.11",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.10.12.11",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.10.13.11",   :netmask => "255.255.255.0"
    config.vm.provision "shell", inline: "sysctl net.inet.ip.forwarding=1"
    config.vm.provision "shell", inline: "route delete default"
    config.vm.provision "bgp", type: "shell", path: "r1.sh"
  end 
  
  config.vm.define "r2" do |config|
    config.vm.hostname = "r2"
    config.vm.guest = :openbsd
    config.vm.network "private_network", :ip => "10.20.2.12",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.10.12.12",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.30.1.2",   :netmask => "255.255.255.0", :virtualbox__intnet => "r2"

    config.vm.provision "shell", inline: "sysctl net.inet.ip.forwarding=1"
    config.vm.provision "shell", inline: "route delete default"
    config.vm.provision "bgp", type: "shell", path: "r2.sh"
  end
  
  config.vm.define "r3" do |config|
    config.vm.hostname = "r3"
    config.vm.guest = :openbsd
    config.vm.network "private_network", :ip => "10.20.3.13",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.10.13.13",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.30.1.2",   :netmask => "255.255.255.0", :virtualbox__intnet => "r3"
    config.vm.provision "shell", inline: "sysctl net.inet.ip.forwarding=1"
    config.vm.provision "shell", inline: "route delete default"
    config.vm.provision "bgp", type: "shell", path: "r3.sh"
  end

  config.vm.define "s1" do |config|
    config.vm.hostname = "s1"
    config.vm.network "private_network", :ip => "10.20.2.100",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.30.1.3",   :netmask => "255.255.255.0", :virtualbox__intnet => "r2"
    
    config.vm.box = "ubuntu/trusty64"
    #config.vm.provision "shell", inline: "route delete default"
    #config.vm.provision "shell", inline: "route add default gw 10.20.2.12"
    
    config.vm.provision "bgp", type: "shell", path: "s1.sh"
    
    #config.vm.guest = :openbsd
    #config.vm.provision "shell", inline: "route delete default"
    #config.vm.provision "shell", inline: "route add default 10.20.2.12"
  end 
  
  config.vm.define "s2" do |config|
    config.vm.hostname = "s2"
    config.vm.network "private_network", :ip => "10.20.3.100",   :netmask => "255.255.255.0"
    config.vm.network "private_network", :ip => "10.30.1.3",   :netmask => "255.255.255.0", :virtualbox__intnet => "r3"
   
    config.vm.box = "ubuntu/trusty64"
    #config.vm.provision "shell", inline: "route delete default"
    #config.vm.provision "shell", inline: "route add default gw 10.20.3.13"
    config.vm.provision "bgp", type: "shell", path: "s2.sh"
    
    # config.vm.guest = :openbsd
    # config.vm.provision "shell", inline: "route delete default"
    # config.vm.provision "shell", inline: "route add default 10.20.3.13"
  end 
  
  config.vm.define "user" do |config|
    config.vm.hostname = "user"
    config.vm.guest = :openbsd
    config.vm.network "private_network", :ip => "10.20.1.100",   :netmask => "255.255.255.0"
    config.vm.provision "shell", inline: "route delete default"
    config.vm.provision "shell", inline: "route add default 10.20.1.11"
  end
end
