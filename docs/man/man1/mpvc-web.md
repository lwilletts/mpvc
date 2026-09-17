---
title: mpvc-web(1)
section: 1
date: September, 2026
---

NAME
====

mpvc-web -- Web and HTTP API interface for mpvc control

SYNOPSIS
========

mpvc-web [option]

DESCRIPTION
===========

**mpvc-web** is a lightweight web interface and HTTP API wrapper for `mpvc`.
It allows users to control an active local `mpv` media player instance remotely
over a network interface using standard HTTP methods or a mobile-friendly browser interface.

OPTIONS
=======

`-c` start|stop|status
: Set the mpvc-web HTTP server command. This option is **required**. Accepted values are `start` to daemonize the server, `stop` to terminate it, `status` to check is running.

`-b` bind-address
: Set the mpvc-web HTTP server bind address. Defaults to `localhost`.

`-p` port
: Set the mpvc-web HTTP server port. Defaults to `8888`.

`-r` directory
: Set the mpvc-web HTTP server root directory path. Defaults to `/tmp/mpvc-web/root`.

`-R` seconds
: Set the mpvc-web HTTP server HTML auto-refresh interval in seconds. Defaults to `240`.

`-s` https
: Set the mpvc-web HTTP server SSL/TLS configurations or certificate paths. Defaults to empty.

`-a` archive
: Set the mpvc-web HTTP server to include a `ytdl-archive/` repository or path tracking download history. Defaults to empty.

`-h`, `--help`
: Display the help synopsis and exit.

EXAMPLES
========

Start the HTTP server listening on localhost at port 8888:

    $ mpvc-web -c start -b 127.0.0.1

Start the HTTP server listening on all interfaces at port 8443:

    $ mpvc-web -c start -b 0.0.0.0 -s 1

ENVIRONMENT
===========

* `MPVC_SOCKET`
  The default path to the mpv IPC socket if the `--socket` flag is omitted.

* `MPVC_WEB_PORT`
  Defines a default network port fallback if `--port` is not explicitly set.

FILES
=====

~/.config/mpvc/mpvc.conf
: mpvc configuration file.

SEE ALSO
========

mpv(1),
[mpvc(1)](mpvc.html),
[mpvc-fzf(1)](mpvc-fzf.html),
[mpvc-tui(1)](mpvc-tui.html),

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com/gmt4/mpvc/issues>

