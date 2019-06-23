
export ANSIBLE_PLAYBOOK_OPTS := \
	--vault-password-file=.ansible-vault-password \
	--inventory tests/inventory
export ANSIBLE_CONFIG := tests/ansible.cfg 

ifdef DEBUG
	ANSIBLE_PLAYBOOK_OPTS += -vvv
endif

%:
	ansible-playbook $(ANSIBLE_PLAYBOOK_OPTS) tests/$@.yml
