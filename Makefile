# A tmp Makefile that just calls mpvc-installer for compat with mpvc-git Arch PKGBUILD (@gmt4)
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
DOCDIR ?= $(PREFIX)/doc
INSTALLER=extras/mpvc-installer
all:
install:
	BINDIR=${DESTDIR}/${PREFIX}/bin ${INSTALLER} install
	DOCDIR=${DESTDIR}/${PREFIX}/share/doc/mpvc/ ${INSTALLER} docs
	LICDIR=${DESTDIR}/${PREFIX}/share/licenses/mpvc/ ${INSTALLER} licenses
link uninstall:
	BINDIR=${DESTDIR}/${PREFIX}/bin ${INSTALLER} "$@"

.PHONY: all link install uninstall
