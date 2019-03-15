include make-do.mk

$(call require-env, TITLE)
# lower-case and replace spaces with dash:
NAME ?= $(shell echo '${TITLE}' | tr [:upper:] [:lower:] | tr -s [:blank:] | tr [:blank:] -)
$(info NAME, ${NAME})

## detect existing feature, accounting for grav ordering prefixes:
check_existing_dir = $(shell find . -maxdepth 1 -name '??.${NAME}')
FEATURE_DIR ?= 	$(shell test '${check_existing_dir}' && echo '${check_existing_dir}' | sed 's/.\///' || echo 00.${NAME})
$(info FEATURE_DIR, ${FEATURE_DIR})

all: templates configure

${FEATURE_DIR}:
	mkdir ${@}

.PHONY: templates
templates: ${FEATURE_DIR}
	@# copy, no-clobber (-n)
	cp -rn ${THIS_DIR}/assets/new-feature/* ${<}/

.PHONY: configure
configure:
	find . -type f -exec sed -i 's/{{NAME}}/${NAME}/g' '{}' \;
	find . -type f -exec sed -i 's/{{TITLE}}/${TITLE}/g' '{}' \;
