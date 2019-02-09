include make-do.mk

$(call require-env, user_name)

export PUBLIC_HTML ?= /home/${user_name}/public_html

help:
	pandoc -t plain README.md

create: base-install ginkgo-install

base-install: ${PUBLIC_HTML}
	@ test $$(id -u) -eq 0 && ( echo "Declining to run as root."; false) || true
	composer create-project getgrav/grav ${PUBLIC_HTML} --no-dev
	docs-user user_name=${user_name} facls

ginkgo-install: base-install ginkgo-grav

${PUBLIC_HTML}:
	# ${@} does not exist. Did you forget to run `docs-user create-user`?
	@ false

update:
	cd '${PUBLIC_HTML}' && bin/gpm selfupgrade -f

serve:
	cd '${PUBLIC_HTML}' && \
	php -S localhost:8947 system/router.php
