---
title: mpvc-web(1)
section: 1
date: September, 2026
---

NAME
====

mpvc-web -- Web application interface for mpvc control

SYNOPSIS
========

mpvc-web [option]

DESCRIPTION
===========

**mpvc-web** is a lightweight web interface and HTTP API wrapper for `mpvc`. It
allows users to control an active local `mpv` media player instance remotely
over a network interface using standard HTTP methods or a mobile-friendly browser interface.

OPTIONS
=======

* `-H`, `--host=ADDRESS`
  Bind the web server to the specified network interface ADDRESS. Defaults to 127.0.0.1.

* `-P`, `--port=PORT`
  Listen for incoming HTTP connections on the specified network PORT. Defaults to 8080.

* `-s`, `--socket=PATH`
  Path to the mpv IPC socket file. Overrides default environment fallback configurations.

* `-v`, `--verbose`
  Enable verbose logging output to stdout for auditing incoming API requests.

* `-h`, `--help`
  Display the help synopsis and exit.

SUBCOMMANDS
===========

The web server exposes endpoints mimicking core `mpvc` commands. These can be executed
via local tool parameters if the script supports immediate runtime hooks:

* `start`
  Daemonize and start the web server in the background.

* `stop`
  Locate and terminate the running background instance of the web server.

* `status`
  Query whether the web server process is actively listening on its designated interface.

EXAMPLES
========

Start the remote controller on all local interfaces using port 8888:

    $ mpvc-web --host 0.0.0.0 --port 8888

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

mpvc(1), mpvc-fzf(1), mpvc-tui(1), mpv(1)

AUTHOR
======

Manual written by gmt4. See https://github.com/gmt4/mpvc for more information.

REPORTING BUGS
==============

Report bugs at: https://github.com/gmt4/mpvc/issues

