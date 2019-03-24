include make-do.mk

$(call require-env, TITLE)
# lower-case and replace spaces with dash:
export NAME ?= $(shell echo '${TITLE}' | tr [:upper:] [:lower:] | tr -s [:blank:] | tr [:blank:] -)
$(info NAME, ${NAME})

# avoid character encoding errors (with sed) by setting locale
export LANG = C
REPLACE_TOKENS = perl -p -i -e 's%\{\{([^}]+)\}\}%defined $$ENV{$$1} ? $$ENV{$$1} : $$&%eg'

## detect existing feature, accounting for grav ordering prefixes:
check_existing_dir = $(shell find . -maxdepth 1 -name '??.${NAME}')
FEATURE_DIR ?= 	$(shell test '${check_existing_dir}' && echo '${check_existing_dir}' | sed 's/.\///' || echo 00.${NAME})
$(info FEATURE_DIR, ${FEATURE_DIR})

all: feature-templates configure
	# TODO: set taxonomy terms

new-doc: doc-templates configure
	# TODO: set taxonomy terms
	# TODO: set canoncial route

${FEATURE_DIR}:
	mkdir ${@}

.PHONY: feature-templates
feature-templates:
	@$(eval TEMPLATE_SRC=new-feature)

.PHONY: doc-templates
doc-templates:
	@$(eval TEMPLATE_SRC=new-doc)

.PHONY: use-templates
use-templates: ${FEATURE_DIR}
	@# copy, no-clobber (-n)
	@# some installs of cp generate an error when files exist despite no-clobber
	-cp -rn ${THIS_DIR}/assets/${TEMPLATE_SRC}/* ${<}/

.PHONY: configure
configure: use-templates
	find . -type f -exec ${REPLACE_TOKENS} '{}' \;
