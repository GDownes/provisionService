Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.network "forwarded_port", guest: 7070, host: 7070
end
