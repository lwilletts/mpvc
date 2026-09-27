---
title: mpvc(1)
section: 1
version: v1.9
date: April, 2026
manual: User Commands
layout: default
last_modified_date: 2026-09-26
---

NAME
====

mpvc - mpc-like command-line control interface for mpv

SYNOPSIS
========

    usage: mpvc opts # @version v1.9 (c) gmt4 https://github.com/gmt4/mpvc
     -a | --add | add         : Add media to playlist (see --load for stdin).
     -r | --remove | rm       : Remove media by id from playlist (see searchrm for rm by title)
     -s | --stop | stop       : Always stop playback.
     -P | --play | play       : Always start playback.
     -p | --toggle            : Toggle playback.
          --repeat | repeat   : Loop the playlist.
          --single | single   : Loop a single file.
        | --next | next       : Jump to next entry in the playlist
        | --prev | prev       : Jump to previous entry in the playlist
     -i | --playlist          : Print filenames of tracks to fit within terminal.
     -I | --fullplaylist      : Print all filenames of tracks in current playlist.
     -v | --vol | vol         : Increase/decrease volume relative to current volume.
     -h | --help              : Prints the short help.
     -H | --help-long         : Prints the long help (tip: mpvc -H 2>&1 | less).

     -f | --format            : Enter a formatting string.
     -j | --track             : Go forwards/backwards through the playlist queue.
     -J | --tracknum          : Jump to playlist item number.
     -A | --playnext          : Add media to playlist after the current track.
     -n | --playnow           : Add media to playlist after the current track, and play it.
        | --playrand          : Select a random track from the playlist, and play it.
        | --save              : Save current playlist to given path.
        | --load              : Load playlist from given path (stdin if none is specified).
     -c | --crop              : Clear the playlist except for the media currently playing.
     -l | --loop              : Loop currently playing playlist.
     -L | --loopfile          : Loop currently playing file.
     -m | --mute              : Toggle sound.
     -t | --seek              : Increase/decrease playback time relatively, accepts % values.
        | --seekrand          : Set a random playback time.
     -T | --time              : Set absolute playback time.
     -x | --speed             : Increase/decrease speed relative to the current speed.
     -X | --speedval          : Set absolute speed.
     -z | --shuffle           : Toggle the shuffle property
     -I | --images            : Enable adding of images to the queue.
        | --color             : Enable color (NO_COLOR=)
        | --nocolor           : Disable color (NO_COLOR=true)
     -k | --kill              : Kill the mpv process controlling the given socket.
     -K | --killall           : Kill all mpv processes indiscriminately.
     -S | --socket            : Set mpv socket [default: $MPVC_SOCKET].
     -q | --quiet             : Suppress all text output.
     -V | --volume            : Set absolute volume.
     -Q | --vid=no            : Start mpv with video output disabled.
     -- |                     : After adding files options after -- are passed to mpv.
        | --version           : Prints the short version.
        | --version-long      : Prints the long version.

     (--)idleloop             : Listen to MPV events on $PROGNAME socket.
     (--)observe              : Observe property in MPV events on $PROGNAME socket.
     (--)playlist-shuffle     : Shuffle the current playlist
     (--)playlist-unshuffle   : Unshuffle the current playlist
     (--)search               : Search the playlist by filename/url.
     (--)searchplay|splay     : Search the playlist by filename and play the first match.
     (--)searchPlay|sPlay     : Search the playlist by title and play the first match.
     -R | --searchrm | srm    : Search the playlist and remove matching entries.
     -M | --searchmv | smv    : Search the playlist and move matching entries.

    *tips: If unsure about where to begin, have a look at https://gmt4.github.io/mpvc

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

Core Playback Commands
----------------------

-P, --play, play
: Always start playback.

-p, --toggle
: Toggle playback.

-s, --stop, stop
: Always stop playback.

--next, next
: Jump to next entry in the playlist.

--prev, prev
: Jump to previous entry in the playlist.

-j, --track
: Go forwards/backwards through the playlist queue.

-J, --tracknum
: Jump to playlist item number.

Playlist Management
-------------------

-a, --add, add
: Add media to playlist (see --load for stdin).

-A, --playnext
: Add media to playlist after the current track.

-n, --playnow
: Add media to playlist after the current track, and play it.

--playrand
: Select a random track from the playlist, and play it.

-r, --remove, rm
: Remove media by id from playlist (see searchrm for rm by title).

-c, --crop
: Clear the playlist except for the media currently playing.

--save
: Save current playlist to given path.

--load
: Load playlist from given path (stdin if none is specified).

--playlist-shuffle
: Shuffle the current playlist.

--playlist-unshuffle
: Unshuffle the current playlist.

-i, --playlist
: Print filenames of tracks to fit within terminal.

-I, --fullplaylist
: Print all filenames of tracks in current playlist.

Advanced Search & Manipulation
------------------------------

--search
: Search the playlist by filename/url.

--searchplay, splay
: Search the playlist by filename and play the first match.

--searchPlay, sPlay
: Search the playlist by title and play the first match.

-R, --searchrm, srm
: Search the playlist and remove matching entries.

-M, --searchmv, smv
: Search the playlist and move matching entries.

Audio, Speed & Time Controls
----------------------------

-v, --vol, vol
: Increase/decrease volume relative to current volume.

-V, --volume
: Set absolute volume.

-m, --mute
: Toggle sound.

-t, --seek
: Increase/decrease playback time relatively, accepts % values.

--seekrand
: Set a random playback time.

-T, --time
: Set absolute playback time.

-x, --speed
: Increase/decrease speed relative to the current speed.

-X, --speedval
: Set absolute speed.

Properties & Daemon Configuration
---------------------------------

--repeat, repeat
: Loop the playlist.

--single, single
: Loop a single file.

-l, --loop
: Loop currently playing playlist.

-L, --loopfile
: Loop currently playing file.

-z, --shuffle
: Toggle the shuffle property.

-I, --images
: Enable adding of images to the queue.

--color
: Enable color (NO_COLOR=).

--nocolor
: Disable color (NO_COLOR=true).

-q, --quiet
: Suppress all text output.

-Q, --vid=no
: Start mpv with video output disabled.

Events & Process Management
---------------------------

--idleloop
: Listen to MPV events on \$PROGNAME socket.

--observe
: Observe property in MPV events on \$PROGNAME socket.

-k, --kill
: Kill the mpv process controlling the given socket.

-K, --killall
: Kill all mpv processes indiscriminately.

-S, --socket
: Set mpv socket [default: \$MPVC_SOCKET].

Help & Version Information
--------------------------

-f, --format
: Enter a formatting string.

-h, --help
: Prints the short help.

-H, --help-long
: Prints the long help (tip: mpvc -H 2>&1, less).

--version
: Prints the short version.

--version-long
: Prints the long version.

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

mpv(1),
[mpvc-fzf(1)](mpvc-fzf.html),
[mpvc-tui(1)](mpvc-tui.html),
[mpvc-web(1)](mpvc-web.html),
[mpvc-equalizer(1)](mpvc-equalizer.html),
[mpvc-index](.),

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com/gmt4/mpvc/issues>

