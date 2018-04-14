.PHONY: main init check boot run clean

main: check lint_check

init:
	if [ ! -d "ansible-retry" ]; then mkdir "ansible-retry"; fi
	ansible-galaxy install -f -p roles -r requirements.yml

check:
	ansible-playbook --syntax-check setup*.yml

lint_check:
	ansible-lint setup*.yml

boot:
	vagrant up

run:
	vagrant provision

clean:
	rm -f setup.retry builds/output.*.log ubuntu-xenial-16.04-cloudimg-console.log
	vagrant destroy -f
