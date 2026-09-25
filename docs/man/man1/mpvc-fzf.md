---
title: mpvc-fzf(1)
section: 1
version: v1.8
date: April, 2026
manual: User Commands
layout: default
---

NAME
====

mpvc-fzf - fuzzy search interface for discovering and playing media with mpvc

SYNOPSIS
========

    usage: mpvc-fzf opts # @version v1.8 (c) gmt4 https://github.com/gmt4/mpvc
      -a|stash      : Start fzf to manage mpvc stashes
      -b|browse     : Start fzf to manage the provided ytdl-archive URL
      -c|chapters   : Start fzf to manage the current mpv chapterlist
      -C|cache      : Search cache by URL for remote media and return local file
     -CC|cmds       : Search and run commands from stdin
      -d|dir        : Set the WD to the media directory given as argument
      -e|eqz        : Start fzf to manage the equalizer settings
      -f|playlist   : Start fzf to manage the current mpv playist
      -g|fetch      : Fetch the given YT URL, and store locally
      -G|Fetch      : Search on Invidious, fetch, and store locally
      -i|lyrics     : Search given media lyrics on Invidious
      -I|Lyrics     : Search given media lyrics on DDG
      -k|dplay      : Search n play DuckDuckGo videos
      -K|dsearch    : Search DuckDuckGo videos
      -l|local      : Search n play local media at $1 (handy to pipe to m load)
      -q|quality    : Select and change yt-dlp video quality (ytdl-format)
      -r|explorer   : Shortcut to search n play local media at ytdl-archive/
      -R|Explorer   : Shortcut to search local media at ytdl-archive/
      -s|search     : Search on Invidious
      -S|socket     : Set mpv socket [default: ].
     -SS|socklist   : Select and set the current mpv socket to operate
      -t|thumbnail  : Retrieve thumbnail_url from metadata of the current YT-URL
      -T|Thumbnail  : Display thumbnail_url from metadata of the provided YT-URL
      -p|splay      : Search n play media found using Invidious
      -u|url        : Search the given YT URL (supports vids,channels,playlist feeds)
      -U|Url        : Search n play the given YT URL
      -x|launch     : Starts mpvc-fzf in a new xterm (config $MPVC_TERM) [combine -x with other opts]
      -y|related    : Search related media on Invidious
      -Y|Related    : Search n play related media using Invidious
      -z|relatedo   : Search current media-title on Invidious and return related media
      -v|version    : Return the mpvc-fzf version.

        (--)now     : Return a shareable URL to the "now listening" playlist
        (--)lofi    : Search n play Lo-Fi channels
        (--)somafm  : Search n play SomaFM channels
        (--)rapi    : Search n play Radio-Browser API channels
        (--)ntsr    : Search n play NTS-Radio API channels
        (--)custom  : Search n play your custom feeds (channels, playlists, ...)
        custom-gen  : Generate a template for your custom feeds (channels, playlists, ...)
        invid-list  : List available Invidious instances (set MPVC_FZF_INVID_URL)

    *tips: If unsure about where to begin, start: mpvc-fzf -p 'kupla mirage'

DESCRIPTION
===========

mpvc-fzf is a fuzzy search interface that integrates fzf with mpvc to enable interactive discovery, searching, and playback of media from multiple sources. It supports local files, YouTube, Invidious, streaming services, and custom feeds.

The tool provides an interactive terminal interface for selecting and managing media, with support for advanced features like video quality selection, equalizer management, and playlist manipulation.

OPTIONS
=======

Search and Playback
-------------------

`-p`, `--splay`
: Search and play media on Invidious.

`-s`, `--search`
: Search for media on Invidious without auto-playing.

`-U`, `--Url`
: Search and play from a given YouTube URL.

`-u`, `--url`
: Search a given YouTube URL (videos, channels, playlists).

`-l`, `--local PATH`
: Search and play local media at the specified path.

`-k`, `--dplay`
: Search and play videos from DuckDuckGo.

`-K`, `--dsearch`
: Search DuckDuckGo videos without auto-playing.

`-y`, `--related`
: Search for related media on Invidious based on current selection.

`-Y`, `--Related`
: Search and play related media on Invidious.

`-z`, `--relatedo`
: Search currently playing media on Invidious for related videos.

Download and Fetch
------------------

`-g`, `--fetch`
: Fetch a YouTube URL and store locally.

`-G`, `--Fetch`
: Search Invidious, fetch the media, and store locally.

`-C`, `--cache`
: Search cache by URL for remote media.

`-r`, `--explorer`
: Shortcut to search ytdl-archive directory.

`-b`, `--browse`
: Manage ytdl-archive URL collections.

Playlist and Media Management
-----------------------------

`-f`, `--playlist`
: Manage the current mpv playlist interactively with fzf.

`-a`, `--stash`
: Manage mpvc stashes (saved playlists or media collections).

`-c`, `--chapters`
: Manage mpv chapter list interactively.

`-e`, `--eqz`
: Manage equalizer settings with preset selection.

`-q`, `--quality`
: Select and change video quality for playback.

Metadata and Information
------------------------

`-i`, `--lyrics`
: Search media lyrics on Invidious.

`-I`, `--Lyrics`
: Search media lyrics on DuckDuckGo.

`-t`, `--thumbnail`
: Retrieve thumbnail URL from media metadata.

`-T`, `--Thumbnail`
: Display thumbnail image from metadata.

Radio and Streaming Services
----------------------------

`--now`, `now`,
: Return shareable "now listening" playlist with current media information.

`--lofi`, `lofi`
: Search and play Lo-Fi music channels.

`--somafm`, `somafm`
: Search and play SomaFM streaming channels.

`--rapi`, `rapi`
: Search and play stations from Radio Browser API.

`--ntsr`, `ntsr`
: Search and play stations from NTS Radio API.

`--custom`, `custom`
: Search and play custom media feeds.

`custom-gen`, `custom-gen`
: Generate a custom feeds template for configuration.

`invid-list`
: List available Invidious instances.

Socket and Display Options
--------------------------

`-S`, `--socket SOCKET`
: Set the path to the mpv Unix socket for communication.

` -SS`, `--socklist`
: Select and set mpv socket from available sockets.

`-x`, `--launch`
: Start mpvc-fzf in a new xterm window.
Information

`-v`, `--version`
: Display mpvc-fzf version information.

`-h`, `--help`
: Display help message with usage information.

EXAMPLES
========

Search and play a song on Invidious:

    mpvc-fzf -p 'kupla mirage'

Search YouTube and interactively select results:

    mpvc-fzf -U

Browse and manage current mpv playlist:

    mpvc-fzf -f

Search for media lyrics on Invidious:

    mpvc-fzf -i 'artist name'

Play Lo-Fi music streams:

    mpvc-fzf lofi

Manage equalizer settings:

    mpvc-fzf -e

Search local music directory:

    mpvc-fzf -l ~/Music

Fetch and download YouTube video locally:

    mpvc-fzf -G 'video title'

Search DuckDuckGo videos and play:

    mpvc-fzf -k 'search query'

Play SomaFM streams:

    mpvc-fzf somafm

Select video quality:

    mpvc-fzf -q

Display media thumbnail:

    mpvc-fzf -T

Search for related videos:

    mpvc-fzf -Y 'video title'

ENVIRONMENT
===========

MPV_SOCKET
: Path to the mpv Unix socket. If not set, mpvc-fzf will attempt to locate the default socket automatically.

FZF_DEFAULT_OPTS
: Default options for fzf fuzzy finder behavior and appearance.

XDG_CONFIG_HOME
: Base directory for user configuration files. Defaults to ~/.config.

FILES
=====

~/.config/mpvc/mpvc.conf
: mpvc configuration file.

~/.config/mpvc/yt-dlp.conf
: yt-dlp configuration for YouTube downloads.

~/.config/mpvc/custom-feeds.json
: Custom media feed definitions for streaming.

~/.cache/mpvc/
: Cache directory for downloaded media and metadata.

SEE ALSO
========

mpv(1),
fzf(1),
yt-dlp(1),
[mpvc(1)](mpvc.html),
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

