---
title: mpvc-equalizer(1)
section: 1
version: v1.8
date: April, 2026
manual: User Commands
---

NAME
====

mpvc-equalizer - manage and adjust audio filter equalizer settings for mpvc

SYNOPSIS
========

    usage: mpvc-equalizer opts # @version v1.8 (c) gmt4 https://github.com/gmt4/mpvc
     save   : Saves equalizer settings
     load   : Loads equalizer settings
     reset  : Resets equalizer settings (set af gains to 0)
     clear  : Clears equalizer settings (clear af)
     toggle : toggle equalizer settings (toggle af)
     preset : Show/Set equalizer settings preset
     values : Show equalizer settings as float values
     bars   : Show equalizer settings as graph bars
     json   : Show equalizer settings as JSON
    *tips: If unsure about where to begin, start with: mpvc-equalizer preset

DESCRIPTION
===========

mpvc-equalizer is a utility helper script bundled with mpvc that configures, toggles, and displays the audio filter (af) equalizer settings of a running mpv instance via local Unix socket connections.

OPTIONS
=======

`save`
: Save the current audio filter equalizer adjustments and gain parameters to the configuration storage.

`load`
: Load previously saved audio filter equalizer configuration profiles directly into the active playback engine workspace.

`reset`
: Reset all equalizer configuration adjustments back to a flat level by setting all audio filter gains to 0.

`clear`
: Clear and completely remove the active audio filter configuration settings from the running instance context.

`toggle`
: Toggle the audio filter equalizer settings on or off to quickly contrast modified frequencies with baseline flat audio output.

`preset`
: Show the active audio filter configuration profile or set the equalizer matrix to a predefined listening preset.

`values`
: Output the current audio filter equalizer gain parameters formatted as a list of raw float values.

`bars`
: Render a visual representation of the active frequency band gain configurations using terminal text graph bars.

`json`
: Export the complete active equalizer audio filter settings profile structured into a standard JSON payload format string.

EXAMPLES
========

Interact with or assign predefined audio equalizing balance templates

        mpvc-equalizer preset

Visually audit configured frequency band gains using terminal graphs

        mpvc-equalizer bars

Toggle active equalizer constraints to evaluate listening profiles

        mpvc-equalizer toggle

Reset all frequency gains back to 0 to balance structural playback

        mpvc-equalizer reset

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
[mpvc-chapter(1)](mpvc-chapter.html),
[mpvc-fzf(1)](mpvc-fzf.html),
[mpvc-tui(1)](mpvc-tui.html),
[mpvc-web(1)](mpvc-web.html),
[mpvc-index](.),

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com>

