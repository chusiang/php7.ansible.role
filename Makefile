.PHONY: main init check syntax_check lint_check yaml_check travis_check	\
	boot run clean

main: check

init:
	if [ ! -d "ansible-retry" ]; then mkdir "ansible-retry"; fi
	ansible-galaxy install -f -p roles -r requirements.yml

check: syntax_check lint_check yaml_check

syntax_check:
	ansible-playbook --syntax-check setup*.yml

lint_check:
	ansible-lint setup*.yml

yaml_check:
	find -name "*.yml" -type f -not -path "./roles/*"		\
		-exec yamllint -c .yamllint.yaml {} \;

travis_check:
	travis lint .travis.yml

boot:
	vagrant up

run:
	vagrant provision

clean:
	rm -f setup.retry ansible-retry/*				\
		builds/output.*.log tests/output.*.log			\
		ubuntu-*-cloudimg-console.log
	vagrant destroy -f
