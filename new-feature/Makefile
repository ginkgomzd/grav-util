include make-do.mk

export TITLE
export NAME

# avoid character encoding errors by setting locale
export LANG = C
REPLACE_TOKENS = perl -p -i -e 's%\{\{([^}]+)\}\}%defined $$ENV{$$1} ? $$ENV{$$1} : $$&%eg'

default: new-feature

init-name: | require-env-TITLE
	$(eval NAME = $(shell echo '${TITLE}' | tr -dc [:alnum:][:space:] | tr [:upper:] [:lower:] | tr -s [:blank:] | tr [:blank:] -))

init-dir: init-name
	@# detect existing feature, accounting for grav ordering prefixes:
	$(eval check_existing_dir = $(shell find . -maxdepth 1 -name '??.${NAME}'))
	$(eval FEATURE_DIR = $(shell test '${check_existing_dir}' && echo '${check_existing_dir}' | sed 's/.\///' || echo 00.${NAME}))
	mkdir ${FEATURE_DIR}

new-%: init-dir
	$(eval TEMPLATE_SRC=new-${*})
	@# copy, no-clobber (-n)
	@# some installs of cp generate an error when files exist despite no-clobber
	-cp -rn ${THIS_DIR}/assets/${TEMPLATE_SRC}/* ${FEATURE_DIR}/
	find . -type f -exec ${REPLACE_TOKENS} '{}' \;
	# TODO: set taxonomy terms
	# TODO: set canoncial route

list:
	echo Available Templates:
	find ${THIS_DIR}/assets -type d -name 'new-*' | sed 's#${THIS_DIR}/assets/# - #'
	echo
