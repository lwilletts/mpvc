PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

SCRIPT = mpvc

.PHONY: all link install uninstall

all: install

link: $(SCRIPT)
	@for script in $(SCRIPT); do \
		ln -svfn $(shell pwd)/$$script $(BINDIR) ; \
	done

install:
	@echo 'Installing mpvc...'
	install -Dm755 mpvc $(DESTDIR)$(PREFIX)/bin/mpvc

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mpvc
