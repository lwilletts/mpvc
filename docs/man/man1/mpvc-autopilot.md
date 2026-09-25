---
title: mpvc-autopilot(1)
section: 1
version: v1.9
date: September, 2026
manual: User Commands
layout: default
---

NAME
====

mpvc-autopilot - Autopilot mode with auto start/stop, and random playlist playback daemon

SYNOPSIS
========

    usage: mpvc-autopilot -[c:hi:n:p:m:M:] args # @version v1.9 (c) gmt4 https://github.com/gmt4/mpvc
     -i : The IP of the device to detect ping presence for mpvc-autopilot (*required)
     -c : The operation cmd to run mpvc-autopilot (default: mpvcap_autostart [mpvcap_autostart,mpvcap_autopilot])
     -C : The presence check to run mpvc-autopilot (default: mpvcap_pingcheck)
     -p : The number of seconds between ping presence checks (default: 300)
     -n : The number of failed ping presence checks after which to pause mpvc (default: 3)
     -m : The minimum hour when to start ping presence (default: 6h AM)
     -M : The maximum hour when to stop ping presence (default: 20h PM)
    *tips: If unsure where to begin, run: mpvc-autopilot -i 192.168.0.2 # your tablet/phone LAN IP


DESCRIPTION
===========

mpvc-autopilot puts mpvc on autopilot mode. It operates in two primary modes: managing absolute playback states based on local network presence, or continuously cycling randomized background tracks during set hours.

OPTIONS
=======

-c MODE
: Set the loop operation mode. Available modes:

* `mpvcap_autostart`: (Default) Toggles play/pause when a device IP enters or leaves the local network.
* `mpvcap_autopilot`: Continuously injects and plays random background tracks from your media directory.

-C CMD
: Set the low-level execution command used for checking target presence (defaults to *mpvcap_pingcheck*).

-h, --help
: Display the utility usage help message and exit.

-i IP
: Specify the local LAN IP address of the device (such as a smartphone or tablet) to track for network presence. **Required** when using presence-based tracking modes.

-m HOUR
: Set the minimum hour constraint (24-hour integer format) when automated tracking or playback routines are allowed to start (defaults to *6* AM).

-M HOUR
: Set the maximum hour constraint (24-hour integer format) when automated routines must pause or stop (defaults to *20* PM).

-n COUNT
: The maximum number of sequential failed presence checks allowed before forcing mpvc to pause playback (defaults to *3*).

-p PERIOD
: Set the countdown sleep delay in seconds between tracking checks or background track rotations (defaults to *300*).

EXAMPLES
========

Start tracking network presence using a phone's IP address with a 5-minute interval:

    mpvc-autopilot -i 192.168.0.2 -p 300 -n 2

Run a continuous random background music loop during office hours:

    mpvc-autopilot -c mpvcap_autopilot -p 180 -m 9 -M 17 -i 1

ENVIRONMENT
===========

XDG_CONFIG_HOME
: Directory where mpvc configuration is stored. Defaults to ~/.config/ if not set.

FILES
=====

~/.config/mpvc/mpvc.conf
: mpvc-specific configuration file.

SEE ALSO
========

[mpvc(1)](mpvc.html),
[mpvc(5)](mpvc.conf.html),
[mpvc-fzf(1)](mpvc-fzf.html),
[mpvc-tui(1)](mpvc-tui.html),
[mpvc-web(1)](mpvc-web.html),
[mpvc-equalizer(1)](mpvc-equalizer.html)
[mpvc-index](.),

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com/gmt4/mpvc/issues>

