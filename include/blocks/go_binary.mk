ifndef _GO_BINARY_MK
_GO_BINARY_MK :=

$(call _Include,block)

$(block)
name = go_binary

local_vars = \
	name \
	srcs \
	#

inherit_vars = \
	go \
	#

pre-before=
before=

define pre-after=
$(call _FailOnEmpty,name)
$(call _FailOnEmpty,srcs)
$(call _FailOnEmpty,go)
_BUILD_PREFIX := $(call get,build_dir)
_TARGET := $(_BUILD_PREFIX)$(name)
endef

define after=
$(_TARGET): $(srcs) | $(_BUILD_PREFIX)
	$(go) -o $$@ $$^

$(_BUILD_PREFIX):
	mkdir -p $$@

.PHONY: clean/$(name)
clean/$(name):
	rm -f $(_TARGET) |:
	rmdir -p $(_BUILD_PREFIX) |:

all: $(_TARGET)
clean: clean/$(name)

endef
$;

endif
