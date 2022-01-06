ifndef _CC_BINARY_MK
_CC_BINARY_MK :=

$(call _Include,block)

$(block)
name = cc_binary

local_vars = \
	name \
	srcs \

inherit_vars = \
	cxx \
	cxxflags \
	cppflags \
	ldflags \
	ldlibs \

pre-before=

define before=
endef

define pre-after=
$(call _FailOnEmpty,name)
$(call _FailOnEmpty,srcs)
_BUILD_DIR := $(call get,build_dir)
_TARGET := $(_BUILD_DIR)$(name)
_OBJS := $(srcs:%=$(_BUILD_DIR)%.o)
_OBJ_DIRS := $(sort $(dir $(_OBJS)))
endef

define after=
$(_TARGET): $(_OBJS) | $(_BUILD_DIR)
	$(cxx) -o $$@ $(ldflags) $$^ $(ldlibs)

$(_OBJS): $(_BUILD_DIR)%.cc.o: %.cc | $(_BUILD_DIR) $(_OBJ_DIRS)
	$(cxx) -o $$@ $(cppflags) $(cxxflags) -c $$^

$(_BUILD_DIR) $(_OBJ_DIRS):
	mkdir -p $$@

.PHONY: clean/$(name)
clean/$(name):
	rm -f $(_OBJS) |:
	rm -f $(_TARGET) |:
	rmdir -p $$(shell echo $(_OBJ_DIRS) | sort -r) |:
	rmdir -p $(_BUILD_DIR) |:

all: $(_TARGET)
clean: clean/$(name)

endef
$;

endif
