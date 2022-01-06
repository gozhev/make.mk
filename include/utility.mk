ifndef _UTILITY_MK
_UTILITY_MK :=

_IncludeAll = $(eval $(foreach x,$(wildcard $(1)*.mk),$(NL)include $(x)))

_FailOnEmpty = $(if $($(1)),,$(error $(_BLOCK): variable '$(1)' must not be empty))

define NL


endef

define LF


endef

endif
