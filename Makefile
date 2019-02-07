include make-do.mk

$(call require-env, project)

public_html ?= /home/${project}/public_html
release ?= 1.5.7

help:
	# grav-util install project=project - creates a grav instance using defaults.
	#
	# grav-util serve - run a server (for dev environments only)
	#
	# grav-util update - gpm selfupgrade

#install: release.zip ${public_html}
install: ${public_html}
	composer create-project getgrav/grav ${public_html} ${release} --no-dev
	docs-user user_name=${project}  facls

${public_html}:
	test -d ${public_html} || docs-user user_name=${project} 

#/tmp/grav-release.zip:
#	curl -Li -o $(@) https://getgrav.org/download/${release}

update:
	'${public_html}/bin'/gpm selfupgrade -f

serve:
	cd '${public_html}' && \
	php -S localhost:8947 system/router.php
