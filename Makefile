include make-do.mk

$(call require-env, user_name)

export PUBLIC_HTML ?= /home/${user_name}/public_html
release ?= 1.5.7

help:
	# grav-util install user_name=user - creates a grav instance using defaults.
	#
	# supply PUBLIC_HTML=/var/www to override the default install location (/hom/user_name/public_html)
	#
	# grav-util serve - run a server (for dev environments only)
	#
	# grav-util update - gpm selfupgrade

install: base-install ginkgo-install

base-install: ${PUBLIC_HTML}
	@ test $$(id -u) -eq 0 && ( echo "Declining to run as root."; false) || true
	composer create-project getgrav/grav ${PUBLIC_HTML} ${release} --no-dev
	docs-user user_name=${user_name} facls

ginkgo-install: base-install ginkgo-grav

${PUBLIC_HTML}:
	# ${@} does not exist. Did you forget to run `docs-user create-user`?
	@ false

update:
	'${PUBLIC_HTML}/bin'/gpm selfupgrade -f

serve:
	cd '${PUBLIC_HTML}' && \
	php -S localhost:8947 system/router.php
