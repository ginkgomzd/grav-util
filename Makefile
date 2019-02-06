include make-do.mk

project ?= getgrav
skeleton ?= learn2-with-git-sync-site
release ?= 1.5.7

help:
	# grav-util install - creates a grav instance using defaults.
	#
	# grav-util install project=myproject - override the directory created.
	#
	# grav-util install skeleton=learn2-with-git-sync-site - override the grav-skeleton used to create the install
	#
	# grav-util serve - run a server (for dev environments only)
	#
	# grav-util update - gpm selfupgrade

install: grav-skeleton-${skeleton}
	mv grav-skeleton-${skeleton} '${project}'

grav-skeleton-$(skeleton): release-${skeleton}.zip
	-unzip -qq release-${skeleton}.zip
	-rm release-${release}.zip

release-%.zip:
	curl -Li -o ${THIS_DIR}$(@) https://getgrav.org/download/skeletons/${skeleton}/${release}

update:
	'${project}/bin'/gpm selfupgrade -f

serve:
	cd '${project}' && \
	php -S localhost:8947 system/router.php
