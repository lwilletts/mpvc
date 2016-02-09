PREFIX = /usr/local
MANDIR = /usr/share/man

install:
	install -Dm755 mpvc $(DESTDIR)$(PREFIX)/bin/mpvc

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/mpvc
