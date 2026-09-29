---
title: Get Started
layout: default
last_modified_date: 2026-09-26
---

# 🎧 mpvc

- **about** Music player in POSIX-sh using mpv from the shell/fzf +
  extras/goodies 📡🛸🚀
- **goodies** Support TUI, FZF, WEB, CLI, playing youtube & streaming
  services ([See \#20221219](logbook.html#logbook-20221219))
- **tags** music-player terminal minimal mpv tui media-player mplayer
  posix-sh mpv-player mpvc mpvc-tui
- **github** <https://github.com/gmt4/mpvc/>
- **promote** Star, share, and promote our work through the buttons
  below if you find it useful. Thanks!


------------------------------------------------------------------------

```text
                                            ___
 ⠀⠀⠀⠀⠀⠀⢀⣤⠖⠂⠉⠉⠉⠀⠒⠤⣀⠀⠀⠀⠀⠀              ____ _/ (_)___ ______⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⠀⣶⡟⢀⣴⣶⣿⣾⣶⣶⣄⡀⠈⠑⢤⡀⠀⠀             / __ `/ / / __ `/ ___/⠀⠀⠀⠀⠀
⠀⠀⠀⡴⣫⣼⡿⣴⡟⠛⠉⠉⠛⠛⠿⣿⣿⣷⣦⡀⠙⢄⠀            / /_/ / / / /_/ (__  ) ⠀⠀⠀⠀⠀
⠀⠀⣼⢁⣟⡟⣷⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣷⣆⠈⢣            \__,_/_/_/\__,_/____/  ⡀⠀⠀⠀⠀
⠀⢰⣿⢼⣿⣷⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⡆⠀⢱⠀⠀
⠀⢸⡵⣾⣇⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣧⠀⠀⢧⠀⠀⠀          ____ ___  ____ _   __  _____
⠀⠘⣴⣿⢯⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡿⠛⠉⠹⡆⠀⠀         / __ `__ \/ __ \ | / / / ___/
⢀⣼⣿⣧⠟⠁⢀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⣴⣶⣴⡇⠀⠀⠀       / / / / / / /_/ / |/ / / /__
⢸⣿⣼⣿⣋⣉⠀⠀⠀⠈⠙⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣷⣷⡀⠀⠀      /_/ /_/ /_/ .___/|___/  \___/
⢸⠁⠊⣿⠛⢛⢟⣦⡀⠀⠀⠀⠈⢆⠀⠀⠀⠀⢀⠔⣨⣶⡜⠂⠈⠽⣧⡀⠀               /_/                           ⠀
⠸⣶⣾⡯⠤⢄⡀⠵⢿⣦⡀⠀⠀⠀⡷⡄⠀⡰⢁⣾⣿⣿⣿⠀⠀⠀⣿⡹⡄         ____ ___  ____ _   __     __     _____/ /_ ⠀
⠀⣿⣡⠦⢄⡀⠈⠳⣬⣹⣿⣆⠀⠀⢉⠻⣴⠇⣾⣿⡟⢻⠁⠀⠀⠀⣿⠁⡇        / __ `__ \/ __ \ | / /  __/ /_   / ___/ __ \⠀
⠀⣿⡭⡀⠀⠈⠲⣦⣸⣿⣿⣿⣧⣀⠈⡔⣜⣴⣿⡟⢀⡎⡈⠀⠀⢰⡿⢠⣷   ⠀   / / / / / / /_/ / |/ /  /_  __/  (__  ) / / /⠀
⠀⢸⣿⣄⣒⡀⡀⣿⣷⡿⣿⢿⣿⣷⡰⡸⣯⣏⣿⡷⢋⣼⣁⡢⢠⠟⠀⣼⣿      /_/ /_/ /_/ .___/|___/    /_/    /____/_/ /_/
⠀⠀⠻⣷⣈⣁⣮⢻⢸⡇⢨⣿⣿⣿⣷⢶⣿⣏⣩⣶⣿⣿⣿⣿⡯⣤⣴⣿⠃               /_/
⠀⠀⠀⠘⠿⣿⣿⣽⣽⣷⣿⣿⣿⣿⣿⡶⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀      (mpvc, where mpv meets the shell)
⠀⠀⠀⠀⠀⠀⠉⠙⠿⢿⣿⣿⣿⣿⠟⠁⠀⠘⠿⣿⣿⣿⠿⠟⠉⠀⠀⠀⠀
```

## Overview

[mpvc](https://github.com/gmt4/mpvc/) is a collection of POSIX shell
scripts:

- [mpvc](https://github.com/gmt4/mpvc/blob/master/mpvc): provides the
  core CLI commands to control mpv
- [extras/mpvc-tui](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-tui):
  provides a console TUI, using mpvc underneath
- [extras/mpvc-fzf](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-fzf):
  provides [fzf](https://github.com/junegunn/fzf) integration to mpvc.
- [extras/mpvc-web](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-web):
  web player to remotely control mpvc (\*a hack)
- [extras/mpvc-web-browser](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-web-browser):
  mpvc-web companion to browse media library (\*a hack)
- [extras/mpvc-mpris](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-mpris):
  speaks [MPRIS](https://github.com/hoyon/mpv-mpris) to control mplayer
  through key-bindings.
- [extras/mpvc-equalizer](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-equalizer):
  provides a basic mpv equalizer for the CLI.
- [extras/mpvc-autopilot](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-autopilot):
  automatic mpv start/stop based on presence
- [extras/mpvc-installer](https://github.com/gmt4/mpvc/blob/master/extras/mpvc-installer):
  provides an installer to install/update mpvc.

For more details on how to use the above tools have a look at the
[logbook.html](logbook.html). In addition, the [casts/](casts/)
directory to shows some screencasts of mpvc in action.

------------------------------------------------------------------------

## ▶️  Installation

```bash
curl -fsSLO https://github.com/gmt4/mpvc/raw/master/extras/mpvc-installer;
# take your time to review the mpvc-installer for peace-of-mind
BINDIR=$HOME/bin SHELL=/bin/sh $SHELL ./mpvc-installer quickstart
```

------------------------------------------------------------------------

## 🚀 Quickstart Guide

Note you can use `m/mx` instead of `mpvc/mpvc-fzf` when typing on the CLI, these are setup by `mpvc-installer`.

### 1. Base Player Controls (mpvc)
```bash
mpvc add https://somafm.com/lush130.pls # Start playing SomaFM lush
mpvc toggle                             # Toggle playback state (play/pause)
mpvc togglev                            # Toggle video playback state (on/off)
mpvc togglei                            # Toggle idle playback state (once/always/off)
mpvc next                               # Skip to the next track in the playlist

find ~/Music -name "*.mp3" | mpvc load  # Pipe local directories into the active queue
```

### 2. Interactive Search Controls (mpvc-fzf)
```bash
mpvc-fzf -f         # Launch fzf to visually manage your current playlist queue
mpvc-fzf -p 'query' # Search on Invidious/YouTube and stream matching audio
mpvc-fzf --rp       # Instantly search and play live RadioParadise audio feeds
mpvc-fzf --lofi     # Instantly search and play live Lo-Fi audio feeds
mpvc-fzf --somafm   # Browse and stream live background channels from SomaFM
```

### 3. Web Browser Control (mpvc-web)

```bash
mpvc-web -c start       # Start, and open `http://localhost:8888` in your browser
mpvc-web -c start -s1   # Start, and open `https://localhost:8443` in your browser
```

For more check the [Log Book](logbook.html) (remember your best chance is to try, play, and have fun).

------------------------------------------------------------------------

## Screenshots

mpvc-fzf running on mac OS (screenshot click to view)

<img src="assets/mpvc-fzf-mac.jpg" style="width:95.0%" alt="mpvc-fzf on Mac OS screenshot" />

mpvc-tui -T: running the mpvc TUI (screenshot click to view)

<img src="assets/mpvc-tui.png" style="width:95.0%" alt="mpvc-tui -T screenshot" />

mpvc-tui -f: running with fzf (screenshot click to view)

<img src="assets/mpvc-tui-arch.png" style="width:95.0%" alt="mpvc-tui fzf screenshot" />

mpvc-tui: running with fzf and desktop notifications on the upper-right
corner (screenshot click to view)

<img src="assets/mpvc-tui-fzf.png" style="width:95.0%" alt="mpvc-tui fzf+notify screenshot" />

------------------------------------------------------------------------

## Documentation

### Usage

Check the mpvc reference manual pages at [index](man/man1/)

### Logbook

The logbook got big enough to deserve a page on its own, see here: [logbook.html](logbook.html)

<!--
    📅 Mon, 15 Jun 2026 by gmt4
    ⚡ PoweredBy #HTML
-->
