# @file Makefile
# @description mpvc Makefile
# @author gmt4 <gmt4 at github.com> (c) Copyright 2022.
# @url github.com/gmt4/mpvc

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

SCRIPT = mpvc extras/mpvc-tui extras/mpvc-fzf extras/mpvc-chapter extras/mpvc-equalizer

all: help
help:
	@grep '^[a-z-]\+: [a-z-]\+' ${MAKEFILE_LIST}

link-user: PREFIX=$(HOME)
link-user: link

install-user: PREFIX=$(HOME)
install-user: install
install-system: PREFIX=/usr/local
install-system: install

uninstall-user: PREFIX=$(HOME)
uninstall-user: uninstall
uninstall-system: PREFIX=/usr/local
uninstall-system: uninstall

link: $(SCRIPT)
	@for script in $(SCRIPT); do \
		ln -svfn $(shell pwd)/$$script $(BINDIR) ; \
	done

install:
	@echo 'Installing mpvc...'
	@for script in $(SCRIPT); do \
		install -Dvm755 $(shell pwd)/$$script $(BINDIR); \
	done

uninstall:
	@echo 'Un-installing mpvc...'
	@for script in $(SCRIPT); do \
		rm -v $(BINDIR)/`basename \$$script`; \
	done

.PHONY: help all link install uninstall

