DESTDIR ?=
PREFIX ?= /usr/local

.PHONY: install
install:
	install --directory $(DESTDIR)$(PREFIX)/include/make.mk
	$(foreach x,$(shell find include -type d),$(LF)\
		install --directory $(DESTDIR)$(PREFIX)/include/make.mk/$(x))
	install --mode=644 make.mk $(DESTDIR)$(PREFIX)/include/make.mk/make.mk
	$(foreach x,$(shell find include -type f),$(LF)\
		install --mode=644 $(x) $(DESTDIR)$(PREFIX)/include/make.mk/$(x))

.PHONY: uninstall
uninstall:
	$(foreach x,$(shell find include -type f),$(LF)\
		-rm --force $(DESTDIR)$(PREFIX)/include/make.mk/$(x))
	-rm --force $(DESTDIR)$(PREFIX)/include/make.mk/make.mk
	$(foreach x,$(shell find include -type d | sort --reverse),$(LF)\
		-rm --force --dir $(DESTDIR)$(PREFIX)/include/make.mk/$(x))
	-rm --force --dir $(DESTDIR)$(PREFIX)/include/make.mk

define LF


endef
