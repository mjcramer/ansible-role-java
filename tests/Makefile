
export ANSIBLE_PLAYBOOK_OPTS := \
	--vault-password-file=./.ansible-vault-password

ifdef DEBUG
	ANSIBLE_PLAYBOOK_OPTS += -vvv
endif

%:
	ansible-playbook $(ANSIBLE_PLAYBOOK_OPTS) $@.yml

