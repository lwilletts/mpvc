![GitHub](https://img.shields.io/github/license/lwilletts/mpvc)
![GitHub Release Date](https://img.shields.io/github/release-date/lwilletts/mpvc)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/lwilletts/mpvc)
![GitHub top language](https://img.shields.io/github/languages/top/lwilletts/mpvc)
![GitHub lines of Code](https://sloc.xyz/github/lwilletts/mpvc/?category=code)

# mpvc 🎧

A terminal music player in POSIX sh(1) that interfaces mpv providing mpc(1) commands + extras.
Originally a fork of [lwillets/mpvc](https://github.com/lwilletts/mpvc) that evolved on its own, providing some extra goodies such as: improved CLI, TUI, FZF, WEB, EQ, & playing media from YouTube & streaming services.
Check the [Wiki](../../wiki), [LogBook](../../wiki#logbook) & [Casts](../../wiki#screencasts) for a detailed view of the extra features of this fork.

<details open>
<summary>mpvc-tui -T: running the mpvc TUI <i>(click to view screenshot)</i></summary>

![mpvc-tui -T screenshot](../../blob/master/docs/assets/mpvc-tui.png)
</details>

<details>
<summary>mpvc-fzf -f: running with fzf to manage the playlist <i>(click to view screenshot)</i></summary>

![mpvc-fzf screenshot](../../blob/master/docs/assets/mpvc-tui-arch.png)
</details>

<details>
<summary>mpvc-tui -n: running with mpvc-fzf and desktop notifications on the upper-right corner <i>(click to view screenshot)</i></summary>

![mpvc tui+fzf+notifications screenshot](../../blob/master/docs/assets/mpvc-tui-fzf.png)
</details>

## Overview ▶️

[mpvc](../../) player functionality is provided by:

- [mpvc](../../blob/master/mpvc): provides the mpvc player core CLI commands
- [extras/mpvc-tui](../../blob/master/extras/mpvc-tui): provides a console TUI, using mpvc underneath
- [extras/mpvc-fzf](../../blob/master/extras/mpvc-fzf): provides FZF integration to mpvc.
- [extras/mpvc-web](../../blob/master/extras/mpvc-web): a hack to remotely control mpvc from web (handy on mobile)
- [extras/mpvc-now](../../blob/master/extras/mpvc-now): generates a URL to share the current playlist
- [extras/mpvc-mpris](../../blob/master/extras/mpvc-mpris): speaks MPRIS to control mpv player through key-bindings.
- [extras/mpvc-equalizer](../../blob/master/extras/mpvc-equalizer): provides a basic mpv equalizer for the CLI.
- [extras/mpvc-autostart](../../blob/master/extras/mpvc-autostart): automatic mpv start/stop based on presence.
- [extras/mpvc-installer](../../blob/master/extras/mpvc-installer): provides an installer to install/update mpvc.

For more details on how to use the above tools have a look at the [LogBook](../../wiki#logbook).
In addition, the [casts/](../../wiki#screencasts) directory to shows some screencasts of mpvc in action.

## Requirements

Required:

- `mpv`
- `socat`: is preferred due to the differing implementations of `netcat` across UNIXes.
- `awk`: a sane version of `awk` for the same reason (`gawk` works)

Recommended extras:

- `curl`
- `fzf`
- `jq`
- `notify-send`

Check for missing dependencies using `mpvc-installer check-reqs`.

## Installation

- [Manual](#manual)
- [Git](#git)
- [Debian](#debian)
- [Arch](#arch-mpvc-git)
- [BSD](#bsd)
- [MacOS](#macos)
- [Gentoo](#gentoo-mpvc)
- [Nix](#nix-mpvc)

### Manual

The easiest install method is just to run the [mpvc-installer](../../blob/master/extras/mpvc-installer) to install under `$HOME/bin`

```console
curl -fsSL -o mpvc-installer https://github.com/lwilletts/mpvc/raw/master/extras/mpvc-installer \
  && sh ./mpvc-installer fetch-user
```

### Git

```sh
 # fetch a local copy of the github repo
 git clone https://github.com/lwilletts/mpvc/
 # use extras/mpvc-installer: just copy/link to your $HOME/bin
 (cd mpvc; extras/mpvc-installer link-user)

 # use mpvc-fzf to search and play youtube media
 mpvc-fzf -p 'kupla mirage'
 # use mpvc to add/load/save media files or online YT URLs
 mpvc add /path/to/your/*.mp3 # or your URLs
 find . -type f -name | mpvc load
 mpvc save my-playlist

 # use mpvc-fzf to manage the playlist
 mpvc-fzf -f
 # use mpvc-tui to start the tui + desktop notifications
 mpvc-tui -T
```

### Debian

Debian (and APT derivatives such as Ubuntu):

```console
apt install mpv gawk curl socat fzf rlwrap jq libnotify-bin
```

### Arch [mpvc-git](https://aur.archlinux.org/packages/mpvc-git)

Arch (and derivatives):

```console
pacaur -y mpvc-git
pacman -Sy mpv gawk curl socat fzf rlwrap jq libnotify
````

### BSD

BSD (and pkg(1) based derivatives such as FreeBSD):

```console
pkg install -y mpv gawk curl socat fzf rlwrap jq libnotify
```

### MacOS

MacOS (and brew(1) based derivatives see [FAQ](../../wiki/FAQ)):

```console
brew install gawk socat fzf rlwrap jq gnu-sed yt-dlp # mpv curl libnotify
```

### Gentoo [mpvc](https://gitlab.com/xy2_/osman)

```console
emerge mpvc
```

### Nix [mpvc](http://github.com/nixos/nixpkgs/tree/master/pkgs/applications/misc/mpvc)

```console
nix-env -i mpvc
```

## Usage

### mpvc

```console
usage: mpvc opts # @version v1.5 (c) gmt4 https://github.com/gmt4/mpvc
    -a | --add              : Add media to playlist (see --load for stdin).
    -s | --stop             : Always stop playback.
    -P | --play             : Always start playback.
    -p | --toggle           : Toggle playback.
       | --next             : Jump to next entry in the playlist
       | --prev             : Jump to previous entry in the playlist
    -i | --playlist         : Print filenames of tracks to fit within terminal.
    -I | --fullplaylist     : Print all filenames of tracks in current playlist.
    -v | --vol              : Increase/decrease volume relative to current volume.
    -h | --help             : Prints the short help.
    -H | --long-help        : Prints the long help.
*tips: If unsure about where to begin, have a look at https://gmt4.github.io/mpvc
```

### mpvc-tui

```console
usage: mpvc-tui -[d:hHktTm:nsSP:x] args # @version v1.5 (c) gmt4 https://github.com/gmt4/mpvc
  -d : Set the WD to the media directory given as argument
  -n : Desktop notification using notify on mpvc events (notify-send*)
  -s : Suggest a random media to play based on previous media played
  -t : Starts the mpvc-tui to manage the mpv playlist (rlwrap*)
  -T : Combo that starts mpvc-tui -t -n, and adds media given as args
  -x : Starts mpvc-tui in a new xterm (config $MPVC_TERM) [combine -x with d:hHktTm:nsSP:x]
*tips: If unsure about where to begin, start with: mpvc-tui -d /path/to/media/ -T
````

### mpvc-fzf

```console
usage: mpvc-fzf -[01ab:cCd:efFg:G:hk:K:n:s:p:P:o:Or:lL:xv] args # @version v1.5 (c) gmt4 https://github.com/gmt4/mpvc
  -b : Browse the provided ytdl-archive URL with fzf (fzf*)
  -c : Start fzf to manage the current mpv chapterlist (fzf*)
  -d : Set the WD to the media directory given as argument
  -f : Start fzf to manage the current mpv playist (fzf*)
  -g : Fetch the given YT URL, and store locally (fzf*)
  -G : Search on Invidious, fetch, and store locally (fzf*)
  -l : Search & play local media (fzf*)
  -s : Search on Invidious (fzf*)
  -p : Search & play media found using Invidious (fzf*)
  -x : Starts mpvc-fzf in a new xterm (config $MPVC_TERM) [combine -x with 01ab:cCd:efFg:G:hk:K:n:s:p:P:o:Or:lL:xv]
*tips: If unsure about where to begin, start with: mpvc-fzf -p 'kupla mirage'
```

## Tricks

There's some basic tricks in [Git](#git) to get you started.
For more  check the  [LogBook](../../wiki#logbook).

This gives just a sneak peek on what's possible to manage mpv from the command-line, your best chances are to go play and have fun.

## Limitations

Like any piece of software, mpvc is not perfect:
- mpvc does not resolve individual files in a directory unless it is
  currently in or has been inside that directory, giving misleading results about
  the total number of files in the current playlist. This is a limitation of mpv.
- mpvc depends on shell tools. If your shell is misconfigured or you are using
  unusual variants of basic UNIX tools, mpvc is not guaranteed to work. However,
  all effort has been made to make mpvc as POSIX compliant as possible.

Check out the [Issue Tracker](../../issues) for further improvements to be made.
