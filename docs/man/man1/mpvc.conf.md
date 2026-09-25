---
title: mpvc.conf
section: 5
date: September 2026
version: v1.9
manual: File Formats and Configurations
layout: default
---

NAME
====

mpvc.conf - Configuration file for mpvc

DESCRIPTION
===========

The **mpvc.conf** file serves as the unified configuration profile and text layout interface for the `mpvc(1)`.

Because the ecosystem is written entirely in POSIX shell scripting, the configuration file is parsed by directly sourcing it into the environment during execution.

The file is divided into clear configuration sections using comment block headers to group each tool configuration on its own section.

CONFIGURATION SECTIONS
======================

MPVC
----

This section defines the mpvc(1) configuration variables.

`MPVC_MPV`
: Defines the executable binary name or path for the core player engine. Defaults to `mpv`.

`MPVC_SOCAT`
: Defines the executable binary name or path used to stream JSON data over unix sockets. Defaults to `socat`.

`MPVC_LOCAL_CACHE`
: Boolean flag switch (`true` or `false`) controlling whether regional caching routines are activated during playback sequences.

`MPVC_FMTSTR`, `MPVC_FMTSTR_LOFI`
: Customizes the output of the `mpvc [status]` command to display a summary of the mpv playing state, shown by the rest of tools.

### Formatting String Tokens

The status strings (`MPVC_FMTSTR` and `MPVC_FMTSTR_LOFI`) parse the following tokens dynamically at runtime to generate the `mpvc [status]` terminal layout view:

*   `%status%`         : Active player state icon or text (e.g., Playing, Paused).
*   `%statuslofi%`     : Stream-specific processing states.
*   `%title%`          : Metadata title track string of the current media file.
*   `%percentage%%`    : Numerical percentage tracking playback progress.
*   `%length%`         : Total temporal duration length of the active track asset.
*   `%position%`       : Index tracking the numerical item number of the track.
*   `%playlistlength%` : Cumulative count tracking total track objects in queue.
*   `%=chapter%`       : Numeric label naming the current playing chapter layer.
*   `/%chapters%`      : Total embedded chapter segments discovered in media container.
*   `%mutelofi%`       : Toggle status indicator flagging audio muting behaviors.
*   `%volume%%`        : Current audio speaker sound level gain percentage metrics.
*   `%shufflelofi%`    : Tracks if random shuffling behaviors are enabled.
*   `%ablooplofi%`     : Displays segment loop hooks.
*   `%singlelofi%`     : Tracks if a single file loop freeze constraint is active.
*   `%repeatlofi%`     : Tracks if playlist wrapper re-looping sequences are active.
*   `%idlelofi%`       : Displays if player engines are idling without an active container.
*   `%videolofi%`      : Video layer processing status symbols.

MPVC-TUI
--------

This section configures terminal environment variables and scaling preferences for the terminal visual frontend interface **mpvc-tui**(1).

`MPVC_TUI_TERM`
: Declares the explicit target shell terminal application spawned specifically when launching graphical console configurations in detached windows.

MPVC-FZF
--------

This section contains option flags, remote scraping node overrides, and execution properties for the interactive search interface **mpvc-fzf**(1).

`MPVC_TERM`
: Defines the system terminal emulator tool launched to spawn detached windows when passing the selection flag `-x` or `launch`. Defaults to `xterm`.

`MPVC_FZF_INVID_URL`
: Stores your preferred URL address link pointing to a public or self-hosted **Invidious** API instance mirror node to handle global text lookups.

MPVC-WEB
--------

This section handles server port rules, encryption endpoints, UI refresh behaviors, and thumbnail parsing switches for the local HTTP daemon interface controller **mpvc-web**(1).

`MPVC_WEB_PORT`
: Specifies the default plaintext HTTP listening network port assigned to the web gateway server daemon. Defaults to `8888`.

`MPVC_WEB_SSL_PORT`
: Declares the network port assigned to handle secure, encrypted HTTPS client browser connections. Defaults to `8443`.

`MPVC_WEB_THUMBNAIL_ENABLE`
: Boolean flag switch (`true` or `false`) controlling whether the web frontend interface actively pulls, parses, and shows media artwork thumbnail images over the network dashboard.

`MPVC_WEB_HTML_REFRESH`
: Establishes a time interval integer (measured in seconds) instructing client web browsers how frequently to automatically reload the page interface state to stay synchronized with track changes. Defaults to `240`.


SEE ALSO
========

mpv(1),
[mpvc(1)](mpvc.html),
[mpvc-fzf(1)](mpvc-fzf.html),
[mpvc-tui(1)](mpvc-tui.html),
[mpvc-web(1)](mpvc-web.html),
[mpvc-index](.),

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com/gmt4/mpvc/issues>

