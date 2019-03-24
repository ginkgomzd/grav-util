include make-do.mk

export PUBLIC_HTML ?= /home/${USER_NAME}/public_html

help:
	@pandoc -t plain ${THIS_DIR}/README.md

${PUBLIC_HTML}:
	# ${@} does not exist. Did you forget to run `docs-user create-user`?
	@ false

create grav-install: ${PUBLIC_HTML}
	$(info $$PUBLIC_HTML is ${PUBLIC_HTML})
	@ test $$(id -u) -eq 0 && ( echo "Declining to run as root."; false) || true
	composer create-project getgrav/grav ${PUBLIC_HTML} --no-dev

update:
	cd '${PUBLIC_HTML}' && bin/gpm selfupgrade -f

docs-user: | require-env-USER_NAME
	docs-user user_name=${USER_NAME} facls

project-lab: docs-user grav-install ginkgo-grav

project-lab-repo: | require-env-PROJ_LAB_REPO require-env-PUBLIC_HTML
	sudo rm -rf ${PUBLIC_HTML}/user
	git clone ${PROJ_LAB_REPO} ${PUBLIC_HTML}/user

dev-env: project-lab-repo
	$(MAKE) -f ${THIS_DIR}/ginkgo-grav/Makefile dev-env admin-login ginkgo-rtfm

new-%:
	$(MAKE) -f ${THIS_DIR}/new-feature/Makefile new-$(*)

list-tpls:
	$(MAKE) -f ${THIS_DIR}/new-feature/Makefile list
