ifndef _MAKE_MK
_MAKE_MK :=

_MAKEMK_PREFIX := $(dir $(lastword $(MAKEFILE_LIST)))
_INCLUDE_PREFIX := $(_MAKEMK_PREFIX)include/
_Include = $(eval include $(_INCLUDE_PREFIX)$1.mk)

$(call _Include,utility)
$(call _Include,block)
$(call _Include,module)
$(call _IncludeAll,$(_INCLUDE_PREFIX)/blocks/)
$(call _Include,globals)

.PHONY: all
all:

.PHONY: clean
clean:

endif
