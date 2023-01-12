PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

SCRIPT = mpvc extras/mpvc-tui extras/mpvc-fzf

.PHONY: all link install uninstall

all: link-user

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
