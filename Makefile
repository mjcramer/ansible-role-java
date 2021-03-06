
export CACHE := $(shell pwd)/.cache
export ANSIBLE_PLAYBOOK_OPTS := \
	--vault-password-file .ansible-vault-password \
	--extra-vars cache=${CACHE}
export ANSIBLE_CONFIG := tests/ansible.cfg 

ifdef DISTROS
	ANSIBLE_PLAYBOOK_OPTS += --extra-vars=distros=$(DISTROS)
else
	ANSIBLE_PLAYBOOK_OPTS += --extra-vars=distros=ubuntu,debian,fedora
endif

ifdef JVM_PROVIDER
	ANSIBLE_PLAYBOOK_OPTS += --extra-vars=jvm_provider=$(JVM_PROVIDER)
endif

ifdef JAVA_VERSION
	ANSIBLE_PLAYBOOK_OPTS += --extra-vars=java_version=$(JAVA_VERSION)
endif

ifdef ADD_ANSIBLE_PLAYBOOK_OPTS
	ANSIBLE_PLAYBOOK_OPTS += ${ADD_ANSIBLE_PLAYBOOK_OPTS}
endif

.PHONY: setup teardown ping

setup:
	ANSIBLE_CONFIG=${ANSIBLE_CONFIG} ansible-playbook \
		$(ANSIBLE_PLAYBOOK_OPTS) \
		--inventory localhost, \
		tests/setup.yml

teardown:
	ANSIBLE_CONFIG=${ANSIBLE_CONFIG} ansible-playbook \
		$(ANSIBLE_PLAYBOOK_OPTS) \
		--inventory localhost, \
		tests/teardown.yml

ip:
	ANSIBLE_CONFIG=${ANSIBLE_CONFIG} ansible \
		--inventory ${CACHE}/inventory.yml \
		--module-name debug --args var=ansible_ssh_host \
		all

ping:
	ANSIBLE_CONFIG=${ANSIBLE_CONFIG} ansible \
		--inventory ${CACHE}/inventory.yml \
		-m ping all

%: 
	ANSIBLE_CONFIG=${ANSIBLE_CONFIG} ansible-playbook \
		$(ANSIBLE_PLAYBOOK_OPTS) \
		--inventory ${CACHE}/inventory.yml \
		tests/$@.yml

