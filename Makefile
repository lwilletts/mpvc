PREFIX   = /usr/local
MANDIR   = ${PREFIX}/share/man
MANPAGES = mpvc

.PHONY: all install uninstall

all: install

install:
	@echo 'Installing mpvc...'
	install -Dm755 mpvc $(DESTDIR)/bin/mpvc

uninstall:
	rm -f $(DESTDIR)/bin/mpvc
