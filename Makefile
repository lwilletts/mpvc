# A tmp Makefile that just calls mpvc-installer for compat with Arch PKGBUILD (@gmt4)
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
DOCDIR ?= $(PREFIX)/docs
all:
link install uninstall:
	BINDIR=${DESTDIR}/${PREFIX}/bin extras/mpvc-installer "$@"
.PHONY: all link install uninstall
