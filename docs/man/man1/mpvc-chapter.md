---
title: mpvc-chapter(1)
section: 1
version: v1.8
date: April, 2026
manual: User Commands
---

NAME
====

mpvc-chapter - manage and merge ffmetadata chapter files for mpvc

SYNOPSIS
========

    usage: mpvc-chapter args # @version v1.8 (c) gmt4 https://github.com/gmt4/mpvc
     (--)list : List ffmetadata chapter-files
     (--)file : Show current ffmetadata chapter-file
     (--)info : Info current ffmetadata chapter-file
     (--)reset: Reset current ffmetadata chapter-file
     (--)load : Load current ffmetadata chapter-file
     (--)gen  : Gen a ffmetadata chapter-file from a < chapterlist.txt
     (--)merge: Merge ffmetadata chapter-file to audio file (args: in ffmeta out)

DESCRIPTION
===========

mpvc-chapter is a utility helper script bundled with mpvc that automates the tracking, creation, parsing, and merging of chapter structures within media files using FFmpeg's ffmetadata format container layout maps.

OPTIONS
=======

`--list`
: List all compiled or cached ffmetadata chapter files currently tracking active streaming or media profiles.

`--file`
: Print the absolute path of the currently active ffmetadata chapter asset configuration.

`--info`
: Display metadata headers, timestamp tracks, layout intervals, and internal structure properties contained within the active chapter file.

`--reset`
: Wipe, clear, and re-initialize the target chapter configuration metadata layout map back to pristine system defaults.

`--load`
: Explicitly register and hot-load the active chapter markers map directly into the running instance workspace.

`--gen`
: Generate a syntactically correct ffmetadata map stream file parsed from standard input. This reads sequential text layouts containing raw timestamp intervals and titles.

`--merge`
: Merge a standalone ffmetadata layout directly back into a targeted physical media container. This command strictly requires three continuous sequential file parameters passed as trailing arguments: the input audio file, the source ffmetadata map file, and the output destination container path.

EXAMPLES
========

Generate an ffmetadata chapter map file from a text listing input stream

        mpvc-chapter --gen < chapterlist.txt

Bake an extracted or parsed metadata layout map directly into an audio track file

        mpvc-chapter --merge input.mp3 track_layout.ffmeta processed_album.mp3

List all tracked workspace chapter files

        mpvc-chapter --list

Check properties and internal metadata of the active tracking file

        mpvc-chapter --info

ENVIRONMENT
===========

MPV_SOCKET
: Override the default MPV socket path. Used by internal companion script wrappers to identify which instance target context boundaries apply.

XDG_CONFIG_HOME
: Directory where mpvc configurations are systematically discovered. Defaults to ~/.config/ if not specified by your shell environment variables.

FILES
=====

~/.config/mpvc/mpvc.conf
: Core mpvc-specific runtime configurations, variable flags, and system mapping settings.

SEE ALSO
========

[mpvc(1)](mpvc.html),
[mpvc(5)](mpvc.conf.html),
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

