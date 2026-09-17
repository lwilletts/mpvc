---
title: mpvc(1)
section: 1
date: April, 2026
---

NAME
====

mpvc - mpc-like command-line control interface for mpv

SYNOPSIS
========

mpvc [options] [file|url|playlist|-]

DESCRIPTION
===========

mpvc is a command-line utility that provides mpc-like control over the
mpv media player. It allows users to manage playback, control volume,
add and remove media from the playlist, and display playlist information
through a simple command-line interface.

The tool communicates with mpv via a Unix socket, enabling remote
control of playback without direct interaction with the mpv window.

OPTIONS
=======

Playback Control
----------------

`-P`, `--play`
: Start playback of the current media.

`-p`, `--toggle`
: Toggle between play and pause states.

`-s`, `--stop`
: Stop playback completely.

`--next`
: Jump to the next entry in the playlist.

`--prev`
: Jump to the previous entry in the playlist.

Playlist Management
-------------------

`-a`, `--add FILE`
: Add a file or URL to the playlist. Supports local files, YouTube URLs, and other media sources.

`-r`, `--remove ID`
: Remove a playlist entry by its numeric ID.

`-i`, `--playlist`
: Display the current playlist with filenames truncated to fit terminal width.

`-I`, `--fullplaylist`
: Display the complete current playlist with full filenames.

Loop and Repeat Modes
---------------------

`--repeat`
: Enable loop mode for the entire playlist. Playback will restart from the beginning after reaching the end.

`--single`
: Enable single-file loop mode. The current file will repeat indefinitely.

Volume Control
--------------

`-v`, `--vol [+-]N`
: Adjust volume by the specified amount. Use +N to increase or -N to decrease volume. Without an argument, displays current volume.

Information and Help
--------------------

`-h`, `--help`
: Display short help message with basic usage information.

`-H`, `--help-long`
: Display detailed help message with all available options and examples.

EXAMPLES
========

Add a file to the playlist:

    mpvc -a /path/to/song.mp3

Toggle playback:

    mpvc -p

Increase volume by 5:

    mpvc -v +5

Decrease volume by 10:

    mpvc -v -10

Display current playlist:

    mpvc -i

Jump to next track:

    mpvc --next

Stop playback:

    mpvc -s

Enable repeat mode:

    mpvc --repeat

Remove track with ID 3:

    mpvc -r 3

ENVIRONMENT
===========

MPV_SOCKET
: Path to the mpv Unix socket. If not set, mpvc will attempt
to locate the default socket automatically.

FILES
=====

~/.config/mpv/mpv.conf
: Main mpv configuration file.

~/.config/mpvc/mpvc.conf
: mpvc-specific configuration file.

~/.config/mpvc/yt-dlp.conf
: Configuration for yt-dlp integration.

SEE ALSO
========

mpv(1), mpc(1), mpvc-fzf(1), mpvc-web(1), mpvc-tui(1), mpvc-equalizer(1)

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com/gmt4/mpvc/issues>

