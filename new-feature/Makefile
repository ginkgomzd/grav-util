include make-do.mk

$(call require-env, TITLE)
# lower-case and replace spaces with dash:
NAME ?= $(shell echo '${TITLE}' | tr [:upper:] [:lower:] | tr -s [:blank:] | tr [:blank:] -)
$(info NAME, ${NAME})

FEATURE_DIR := 00.${NAME}

all: templates configure

${FEATURE_DIR}:
	mkdir 00.${@}

.PHONY: templates
templates: ${FEATURE_DIR}
	@# copy, no-clobber (-n)
	cp -rn ${THIS_DIR}/assets/new-feature/* ${<}/

.PHONY: configure
configure:
	find . -type f -exec sed -i 's/{{NAME}}/${NAME}/g' '{}' \;
	find . -type f -exec sed -i 's/{{TITLE}}/${TITLE}/g' '{}' \;
