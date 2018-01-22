Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.disksize.size = '55GB'
  config.vm.hostname = "ubuntu-k8s"
  # Ignore vguest updates during prov (faster)
  # config.vbguest.auto_update = false
  config.vm.synced_folder "storage/", "/vagrant/storage", create: true
  
config.vm.provider "virtualbox" do |v|   
  v.memory = 4096   
  v.cpus = 2
end

  # -= ANSIBLE =-
  # Use :ansible or :ansible_local to provision
  config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "provisioning/site.yml"
    ansible.install_mode = "pip"
    ansible.version = "2.4.2.0"
  end
end
