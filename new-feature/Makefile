include make-do.mk

$(call require-env, TITLE)
# lower-case and replace spaces with dash:
NAME ?= $(shell echo '${TITLE}' | tr [:upper:] [:lower:] | tr -s [:blank:] | tr [:blank:] -)
$(info NAME, ${NAME})

all: ${NAME} configure

${NAME}:
	cp -r ${THIS_DIR}/assets/new-feature 00.${@}

.PHONY: configure
configure:
	find . -type f -exec sed -i 's/{{NAME}}/${NAME}/g' '{}' \;
	find . -type f -exec sed -i 's/{{TITLE}}/${TITLE}/g' '{}' \;
