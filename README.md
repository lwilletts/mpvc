# 🎧 mpvc

![GitHub](https://img.shields.io/github/license/lwilletts/mpvc)
![GitHub Release Date](https://img.shields.io/github/release-date/lwilletts/mpvc)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/lwilletts/mpvc)
![GitHub top language](https://img.shields.io/github/languages/top/lwilletts/mpvc)
![GitHub lines of Code](https://sloc.xyz/github/lwilletts/mpvc/?category=code)

[ [Intro](#%EF%B8%8F-overview-1) | [Reqs](#requirements) | [Install](#installation) | [Config](#configuration) | [Docs](#documentation) | [Usage](#usage) ]

Music player in POSIX-sh using mpv from the shell/fzf + extras/goodies [^install] 📡🛸🚀.

A fork of [lwillets/mpvc](https://github.com/lwilletts/mpvc) evolving on its own adding features such as: improved interfaces to CLI, TUI, FZF, WEB, EQZ, & play streaming services as YouTube/Invidious, with a focus on being fully programmable/scriptable from the shell.
For more on the features of this fork check: [Git](#git) install, [LogBook](#logbook) & [Casts](#screencasts).

⏩ Skip directly to [Installation](#installation) to try mpvc!

<details>
<summary>mpvc-fzf running on macOS <i>(click to view screenshot)</i></summary>

![mpvc-fzf on macOS](../../blob/master/docs/assets/mpvc-fzf-mac.jpg)
</details>

<details>
<summary>mpvc-tui -T: running the mpvc TUI (with albumart) <i>(click to view screenshot)</i></summary>

![mpvc-tui -T screenshot](../../blob/master/docs/assets/mpvc-tui-new.png)
</details>

<details>
<summary>mpvc-tui -T: running the mpvc TUI <i>(click to view screenshot)</i></summary>

![mpvc-tui -T screenshot](../../blob/master/docs/assets/mpvc-tui.png)
</details>

<details open>
<summary>mpvc-fzf -f: running with fzf to manage the playlist <i>(click to view screenshot)</i></summary>

![mpvc-fzf screenshot](../../blob/master/docs/assets/mpvc-tui-arch.png)
</details>

<details open>
<summary>mpvc-tui -n: running with mpvc-fzf and desktop notifications on the upper-right corner <i>(click to view screenshot)</i></summary>

![mpvc tui+fzf+notifications screenshot](../../blob/master/docs/assets/mpvc-tui-fzf.png)
</details>

## ▶️ Overview [^install]

`mpvc` is a collection of POSIX shell scripts:

- [mpvc](../../blob/master/mpvc): provides the core CLI commands to control mpv
- [extras/mpvc-tui](../../blob/master/extras/mpvc-tui): provides a console TUI, using mpvc underneath
- [extras/mpvc-fzf](../../blob/master/extras/mpvc-fzf): provides FZF integration to mpvc.
- [extras/mpvc-web](../../blob/master/extras/mpvc-web): web player to remotely control mpvc (a hack)
- [extras/mpvc-web-browser](../../blob/master/extras/mpvc-web-browser): mpvc-web companion to browse media library (a hack)
- [extras/mpvc-mpris](../../blob/master/extras/mpvc-mpris): speaks MPRIS to control mpv player through key-bindings.
- [extras/mpvc-equalizer](../../blob/master/extras/mpvc-equalizer): provides a basic mpv equalizer for the CLI.
- [extras/mpvc-autopilot](../../blob/master/extras/mpvc-autopilot): automatic mpv start/stop based on presence.
- [extras/mpvc-installer](../../blob/master/extras/mpvc-installer): provides an installer to install/update mpvc.

For more details on how to use the above tools have a look at the [Git](#git) install guide and the [LogBook](#logbook).
In addition, the [casts/](#screencasts) directory to shows some screencasts of mpvc in action.

## Requirements

Required:
- `sh`: a POSIX compliant shell (`/bin/sh` works)
- `mpv`: the mpv media player (see https://mpv.io)
- `socat`: is preferred due to the differing implementations of `netcat` across UNIXes.
- `awk`: a sane version of `awk` for the same reason (GNU/BSD `awk` works)

Recommended extras:

- `curl`
- `fzf`
- `jq`
- `notify-send`
- `yt-dlp`
- `cava`

>[!WARNING]
> **Note tools must be up to date**, in special `yt-dlp` to play streaming services, run `mpvc-installer check-reqs|config-user` to check and update.

## Installation

- [Curl](#curl)
- [Git](#git)
- [Debian](#debian)
- [Arch](#arch-mpvc-git)
- [BSD](#bsd)
- [MacOS](#macos)
- [Gentoo](#gentoo-mpvc)
- [Nix](#nix-mpvc)

Installing is just a matter of fetching the scripts either via [Git](#git)/[Curl](#curl)/etc., scripts can be used directly from the repo, the `mpvc-installer` bit is just there for easiness, to fetch & link them into your `BINDIR=~/bin/` that [mpvc-installer](../../blob/master/extras/mpvc-installer) does by default.

The easiest for a onetime install is using [Curl](#curl), however for the @latest and keeping always updated a [Git](#git) install is recommended.

### Curl

Fetch the mpvc-installer (written in POSIX-sh), and ensure it runs under a POSIX-sh SHELL

* __Zen Install__ achieve inner peace of mind before piping to your shell.


```console
curl -fsSLO https://github.com/lwilletts/mpvc/raw/master/extras/mpvc-installer;
# take your time to review the mpvc-installer for peace-of-mind
BINDIR=$HOME/bin SHELL=/bin/sh $SHELL ./mpvc-installer quickstart
```

* __YOLO Install__ fast, but you're trusting the pipe (curl|sh).


```console
curl -fsSLO https://github.com/lwilletts/mpvc/raw/master/extras/mpvc-installer \
  && SHELL=/bin/sh BINDIR=$HOME/bin sh ./mpvc-installer quickstart
```

### Git

Clone the git repo to receive quick development updates via `git pull`, then, use the `mpvc-installer` inside the repo:

```sh
 # fetch a local copy of the github repo
 git clone https://github.com/lwilletts/mpvc/

 # use extras/mpvc-installer: just copy/link to BINDIR=$HOME/bin (by default)
 (cd mpvc; extras/mpvc-installer link-user)
 (cd mpvc; extras/mpvc-installer check-reqs)
 (cd mpvc; extras/mpvc-installer config-user)
```

Once installed, you can start using mpvc, below are some examples to get started:

```
 # use mpvc to add/load/save media files or online YT URLs
 mpvc add /path/to/your/*.mp3 # or your URLs
 find . -type f -name '*.mp3' | mpvc load
 fzf | mpvc load # even better than the above
 mpvc save my-playlist

 # use mpvc stash to store/recover current mpv state
 mpvc stash ls
 mpvc stash push current
 mpvc stash apply current

 # use mpvc-fzf to manage mpvc stash (see mpvc-fzf -h for more)
 mpvc-fzf -a
 # use mpvc-fzf to search and play youtube media
 mpvc-fzf -p 'kupla mirage'
 # use mpvc-fzf to browse & play lofi girl music (archive.org)
 mpvc-fzf -b https://archive.org/download/lofigirl-youtube/mp3/
 # use mpvc-fzf to randomly enqueue a few lofi tracks (see mpvc-fzf lofi)
 mpvc-fzf -B https://archive.org/download/lofigirl-youtube/mp3/ | shuf -n 128 | mpvc load
 # use mpvc-fzf to manage the playlist
 mpvc-fzf -f
 # use mpvc-tui to start the tui + desktop notifications
 mpvc-tui -T
```

For more  check the  [LogBook](#logbook) (remember your best chance is to try, play, learn, and have fun).

### Debian

Debian (and APT derivatives such as Ubuntu):

```console
apt install mpv gawk curl socat fzf rlwrap jq libnotify-bin # cava
```

### Arch [mpvc-git](https://aur.archlinux.org/packages/mpvc-git)

Arch (and derivatives):

```console
pacaur -y mpvc-git
pacman -Sy mpv gawk curl socat fzf rlwrap jq libnotify # cava
````

### BSD

BSD systems as OpenBSD and NetBSD using pkg_add(1) see [FAQ](../../blob/master/docs/FAQ.md):

```console
pkg_add mpv curl socat fzf rlwrap jq libnotify # mpv-mpris cava python3
```

BSD systems as FreeBSD using pkg(1) see [FAQ](../../blob/master/docs/FAQ.md):

```console
pkg install -y mpv curl socat fzf rlwrap jq libnotify # mpv-mpris cava python3
```

### MacOS

MacOS (and brew(1) based derivatives see [FAQ](../../blob/master/docs/FAQ.md)):

```console
brew install mpv curl socat fzf rlwrap jq libnotify yt-dlp # cava
```

### Gentoo [mpvc](https://gitlab.com/xy2_/osman)

```console
emerge mpvc
```

### Nix [mpvc](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/mp/mpvc/)

```console
nix-env -i mpvc
```

## Configuration

Running `mpvc-installer config-user`, just installs the default configuration files from [config/](../../blob/master/docs/config/) listed below under `~/.config/mpvc/`, afterwards, check and adjust them to suit your needs.

- `mpvc` configuration is performed on [config/mpvc.conf](../../blob/master/docs/config/mpvc.conf).

- `mpv` configuration is performed on [config/mpv.conf](../../blob/master/docs/config/mpv.conf).

- `yt-dlp` configuration is performed on [config/yt-dlp.conf](../../blob/master/docs/config/yt-dlp.conf).

- `shell` aliases to type less [config/bash_aliases.mpvc](../../blob/master/docs/config/bash_aliases.mpvc).

- `$TERM` configuration: A decent terminal with color/sixels support is recommended (`256color/vt340`), but outside of the scope of `mpvc` config.

### QuickConfig

For a quick config just copy/symlink docs/config/ to ~/.config/mpvc/

```console
# either use `mpvc-installer config-user` or do the cp/symlink by hand
cd mpvc/
ln -f -s $PWD/docs/config/mpv.conf ~/.config/mpv/
ln -f -s $PWD/docs/config/mpvc.conf ~/.config/mpvc/
ln -f -s $PWD/docs/config/yt-dlp.conf ~/.config/mpvc/

```

## Documentation

### Manuals

* [docs/man/](../../blob/master/docs/man/)
: For the `mpvc(1)` command read the mpvc manual page.

* [https://mpv.io/manual/stable/](https://mpv.io/manual/stable/)
: For the `mpv(1)` command read the mpv reference manual.

* [logbook](#logbook)
: For the functionality specific of this [fork](https://github.com/gmt4/mpvc) your best aim is the [logbook](#logbook)

### Logbook

The logbook (blog) is a companion of mpvc that covers mpvc usage & evolution:

* [https://gmt4.github.io/mpvc/logbook.html](https://gmt4.github.io/mpvc/logbook.html)

### Screencasts

Have a look at the screencasts to watch mpvc in action.

* [https://gmt4.github.io/mpvc/casts/](https://gmt4.github.io/mpvc/casts/)

### FAQ

Check the FAQ for any questions left after reading the above docs.

* [docs/FAQ.md](../../blob/master/docs/FAQ.md)

### Issues

If you encounter a bug file an [Issue](../../issues).

## Usage

### mpvc

```console
usage: mpvc opts # @version v1.8 (c) gmt4 https://github.com/gmt4/mpvc
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

*tips: If unsure about where to begin, have a look at https://gmt4.github.io/mpvc
```

### mpvc-tui

```console
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
 -x|launch      : Starts mpvc-tui in a new xterm ($MPVC_TUI_TERM) # combine with <opts>
 -v|version     : Prints the mpvc-tui version.

*tips: If unsure about where to begin, start with: mpvc-tui -d /path/to/media/ -T
````

### mpvc-fzf

```console
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
  -k|dplay      : Search & play DuckDuckGo videos
  -K|dsearch    : Search DuckDuckGo videos
  -l|local      : Search & play local media at $1 (handy to pipe to m load)
  -q|quality    : Select and change yt-dlp video quality (ytdl-format)
  -r|explorer   : Shortcut to search & play local media at ytdl-archive/
  -R|Explorer   : Shortcut to search local media at ytdl-archive/
  -s|search     : Search on Invidious
  -S|socket     : Set mpv socket [default: ].
 -SS|socklist   : Select and set the current mpv socket to operate
  -t|thumbnail  : Retrieve thumbnail_url from metadata of the current YT-URL
  -T|Thumbnail  : Display thumbnail_url from metadata of the provided YT-URL
  -p|splay      : Search & play media found using Invidious
  -u|url        : Search the given YT URL (supports vids,channels,playlist feeds)
  -U|Url        : Search & play the given YT URL
  -x|launch     : Starts mpvc-fzf in a new xterm (config $MPVC_TERM) [combine -x with other opts]
  -y|related    : Search related media on Invidious
  -Y|Related    : Search & play related media using Invidious
  -z|relatedo   : Search current media-title on Invidious and return related media
  -v|version    : Return the mpvc-fzf version.

    (--)now     : Return a shareable URL to the "now listening" playlist
    (--)lofi    : Search & play Lo-Fi channels
    (--)somafm  : Search & play SomaFM channels
    (--)rapi    : Search & play Radio-Browser API channels
    (--)ntsr    : Search & play NTS-Radio API channels
    (--)custom  : Search & play your custom feeds (channels, playlists, ...)
    custom-gen  : Generate a template for your custom feeds (channels, playlists, ...)
    invid-list  : List available Invidious instances (set MPVC_FZF_INVID_URL)

*tips: If unsure about where to begin, start: mpvc-fzf -p 'kupla mirage'
```

### mpvc-installer

```console
usage: mpvc-installer args # @version v1.8 (c) gmt4 https://github.com/gmt4/mpvc
  quickstart     : QuickStart Install for first-time users
  quickstart-rm  : QuickStart Removal for first-time users

  check-update   : Check for updates
  check-reqs     : Check for required packages
  config         : Fetch mpv config
  config-user    : Fetch mpv config to BINDIR=/home/user/bin
  config-sys     : Fetch mpv config to BINDIR=/usr/local/bin
  fetch-user     : Fetch to BINDIR=/home/user/bin
  link-user      : Symlink to BINDIR=/home/user/bin
  install        : Install to BINDIR=/usr/local/bin
  uninstall      : Uninstall from BINDIR=/usr/local/bin
  install-user   : Install to BINDIR=/home/user/bin
  install-sys    : Install to BINDIR=/usr/local/bin (sets PREFIX=/usr/local)
  uninstall-user : Uninstall from BINDIR=/home/user/bin
  uninstall-sys  : Uninstall from BINDIR=/usr/local/bin (sets PREFIX=/usr/local)

*tips: If unsure where to start, start with: mpvc-installer fetch-user
```

[^install]: Skip directly to [Installation](#installation) to try mpvc
