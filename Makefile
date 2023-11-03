# A tmp Makefile that just calls mpvc-installer for compat with Arch PKGBUILD (@gmt4)
PREFIX ?= /usr/local
BINDIR ?= $(DESTDIR)$(PREFIX)/bin

all:
link install uninstall:
	@extras/mpvc-installer "$@"
.PHONY: all link install uninstall
