---
title: mpvc-tui(1)
section: 1
version: v1.8
date: April, 2026
manual: User Commands
layout: default
---

NAME
====

mpvc-tui - Terminal User Interface for displaying the MPV playlist and playback

SYNOPSIS
========

    usage: mpvc-tui opts # @version v1.8 (c) gmt4 https://github.com/gmt4/mpvc
     -d|dir         : Set the WD to the media directory given as argument
     -h|help        : This help you are reading
     -H|history     : Starts the mpvc-tui history
     -k|kill        : Stop the running mpvc-tui
     -n|notify      : Desktop notification using notify on mpvc events (notify-send*)
       |socket      : Set mpv socket [default: ].
     -s|suggest     : Suggest a random media to play based on previous media played
     -S|scrobler    : Starts the mpvc-tui scrobbler
     -t|tui         : Starts the mpvc-tui TUI
     -tt|tinytui    : Starts the mpvc-tui TUI (tiny mode)
     -ttt|ttinytui  : Starts the mpvc-tui TUI (ttiny mode)
     -T|Tui         : Combo that starts mpvc-tui -t -n, and adds media given as args
     -x|launch      : Starts mpvc-tui in a new xterm ($MPVC_TUI_TERM) # combine with 
     -v|version     : Prints the mpvc-tui version.
    *tips: If unsure about where to begin, start with: mpvc-tui -d /path/to/media/ -T

DESCRIPTION
===========

mpvc-tui is a terminal-based user interface that displays status/playlist info of the currently mpv instance.

OPTIONS
=======

`-d`, `--dir PATH`
: Set the working directory to the specified media directory. All media operations will be relative to this directory.

`-h`, `--help`
: Display the help message and exit.

`-H`, `--history`
: Start the mpvc-tui history interface. This allows you to browse and replay previously played media.

`-k`, `--kill`
: Stop the currently running mpvc-tui instance.

`-n`, `--notify`
: Enable desktop notifications for mpvc events using notify-send. Notifications will appear for playback state changes and media transitions.

`--socket PATH`
: Set the MPV socket path. Overrides the default socket connection (defaults to MPV's standard socket if not specified).

`-s`, `--suggest`
: Suggest a random media item to play based on previously played media. Useful for discovering content from your history.

`-S`, `--scrobbler`
: Start the mpvc-tui scrobbler interface. This feature tracks and logs media that you play.

`-t`, `--tui`
: Start the main TUI for managing the MPV playlist (uses rlwrap for enhanced readline functionality).

`-T`, `--Tui`
: Combo option that starts mpvc-tui with both TUI (-t) and desktop notifications (-n) enabled. This is the recommended starting option. Additional files provided as arguments will be added to the playlist.

`-x`, `--launch`
: Start mpvc-tui in a new xterm window. This respects the `$MPVC_TUI_TERM` environment variable for terminal selection. Can be combined with other options.

`-v`, `--version`
: Display the mpvc-tui version and exit.

EXAMPLES
========

Start TUI with notifications for a media directory

	mpvc-tui -d ~/Music -T
	mpvc-tui -t

Enable desktop notifications separately

	mpvc-tui -n

Launch in a new terminal window

	mpvc-tui -x -t -d ~/Music

Access playback history

	mpvc-tui -H

Enable media scrobbling

	mpvc-tui -S

ENVIRONMENT
===========

MPVC_TUI_TERM
: Specifies the terminal emulator to use when launching mpvc-tui with the -x option. If not set, xterm is used as the default.

MPV_SOCKET
: Override the default MPV socket path. Can also be set directly using the --socket option.

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

