VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Base VM OS configuration.
  # config.vm.box = "centos/7"
  config.vm.box = "ubuntu/bionic64"
  # config.vm.box = "google/gce"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.define "java-1"
  config.vm.hostname = "java-1"

  # config.vm.provider :google do |google, override|
  #   google.google_project_id = "sandbox-1023"
  #   google.google_client_email = "travis-ci@sandbox-1023.iam.gserviceaccount.com"
  #   google.google_json_key_location = "/Users/cramer/.gcp/mjcramer-travis-ci.json"
  #   google.name = config.vm.hostname
  #   google.image_family = 'ubuntu-1804-lts'
  #   google.preemptible = true
  #   google.auto_restart = false
  #   google.on_host_maintenance = "TERMINATE"
  #
  #   override.ssh.username = ENV['USER']
  #   override.ssh.private_key_path = "~/.ssh/google_compute_engine"
  # end

  # Virtualbox configuration
  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.name = config.vm.hostname
    virtualbox.customize ['modifyvm', :id, '--memory', '2048']
    virtualbox.customize ['modifyvm', :id, '--ioapic', 'on']
    virtualbox.customize ['modifyvm', :id, '--cpus', '1']
    virtualbox.customize ['modifyvm', :id, '--cpuexecutioncap', '50']
  end

  config.vm.provision :shell do |shell|
    shell.inline = "sudo apt-get update -y ; sudo apt-get install -y python"
  end

  config.vm.provision :ansible do |ansible|
    ansible.compatibility_mode = "auto"
    # Disable default limit to connect to all the machines
    ansible.limit = "all"
    ansible.playbook = "tests/test.yml"
    ansible.host_vars = {
        'java-1' => {
            :docker_config_storage_device => '/dev/sdc'
        }
    }
    ansible.extra_vars = {
    }
  end

end
