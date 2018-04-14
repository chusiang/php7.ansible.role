# -*- mode: ruby -*-
Vagrant.configure("2") do |config|

  # Ubuntu
  config.vm.define "ubuntu1404", primary: true do |node|
    node.vm.box = "ubuntu/trusty64"
    node.vm.hostname = "ubuntu1404.php7.local"
    node.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true
    end
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yml"
      ansible.become = true
    end
  end

  # Debian
  config.vm.define "debian8" do |node|
    node.vm.box = "debian/jessie64"
    node.vm.hostname = "debian8.php7.local"
    node.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true
    end
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yml"
      ansible.become = true
    end
  end

  config.vm.define "debian9" do |node|
    node.vm.box = "debian/stretch64"
    node.vm.hostname = "debian9.php7.local"
    node.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true
    end
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yml"
      ansible.become = true
    end
  end

  # CentOS
  config.vm.define "centos6" do |node|
    node.vm.box = "bento/centos-6.7"
    node.vm.hostname = "centos6.php7.local"
    node.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true
    end
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yml"
      ansible.become = true
    end
  end

  config.vm.define "centos7" do |node|
    node.vm.box = "bento/centos-7.3"
    node.vm.hostname = "centos7.php7.local"
    node.vm.provider "virtualbox" do |vb|
      vb.linked_clone = true
    end
    node.vm.provision "ansible" do |ansible|
      ansible.playbook = "setup.yml"
      ansible.become = true
    end
  end

end

# vi: set ft=ruby :
