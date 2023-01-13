
![GitHub](https://img.shields.io/github/license/gmt4/mpvc)
![GitHub Release Date](https://img.shields.io/github/release-date/gmt4/mpvc)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/gmt4/mpvc)
![GitHub top language](https://img.shields.io/github/languages/top/gmt4/mpvc)
![GitHub lines of Code](https://sloc.xyz/github/gmt4/mpvc/?category=code)

# mpvc

An mpc-like control interface for mpv with a nearly complete compatibility layer for mpc commands in
addition to GNU style arguments. [Check out the mpc manpage for details.](http://linux.die.net/man/1/mpc)

`mpvc-tui -T: running the mpvc TUI`
![mpvc-tui -T screenshot](https://github.com/gmt4/mpvc/blob/master/docs/assets/mpvc-tui.png)

`mpvc-tui -f: running with fzf`
![mpvc-tui fzf screenshot](https://github.com/gmt4/mpvc/blob/master/docs/assets/mpvc-tui-arch.png)

`mpvc-tui -n: running with fzf and desktop notofications on the upper-right corner`
![mpvc-tui fzf+notify screenshot](https://github.com/gmt4/mpvc/blob/master/docs/assets/mpvc-tui-fzf.png)

## Dependencies

Required:

- `mpv`
- `socat`: is recommended due to the differing implementations of `netcat` across UNIXes.
- `awk`: a sane version of `awk` is recommended

Recommended extras:

- `curl`
- `fzf`
- `notify-send`

## Install

If you have packaged mpvc for your distribution, let me know so I can add it here.

Distribution Packages:
- [Arch](https://aur.archlinux.org/packages/mpvc-git) - `pacaur -y mpvc-git`
- [Gentoo](https://gitlab.com/xy2_/osman) - `emerge mpvc`
- [Nixos](http://github.com/nixos/nixpkgs) - `nix-env -i mpvc`

To manually install mpvc, use the Makefile provided or link/copy mpvc to somewhere to your $PATH.

## Usage

mpvc requires the use of mpv and its `--input-ipc-server` option.

mpvc automatically opens an ipc-server for you when adding files to be played,
but by default will close the ipc-server when all files have finished playing.

To keep the ipc-server open permanently, use:
```
$ mpv --input-ipc-server=/tmp/mpvsocket
```

You can also specify the default ipc server in your $XDG_CONFIG_HOME/mpv.conf
which will make the most recent mpv instance you start be controllable via mpvc:
```
input-ipc-server=/tmp/mpvsocket
```

However, this may not be suitable if you have background music added
to the socket and then open a video using mpv. The new mpv instance will be
controllable through the socket, but the previous instance is not. You can get around
this by adding the video via mpvc, and manually switching to the video.

## Useful Tricks

- Hotkey daemons like [sxhkd](https://github.com/baskerville/sxhkd) can be used
  to bind mpvc commands to key combinations. Alternatively check your window
  manager documentation on how to bind keys to commands.
- Any URL that can be played using mpv can be added to the playlist, e.g. using
  [mps-youtube](https://github.com/mps-youtube/mps-youtube) with `player` set to
  mpvc and `playerargs` set to add.
- mpvc GNU options can be combined together to give improved results: `$ mpvc -P
  -j 1` will make mpvc always start playing when switching to the next track.
- Piping files directly into mpvc is possible and preferable when loading
  multiple directories to be played:
```
$ find . -type f | mpvc
```
- You can use m3u playlists with mpv by saving the absolute path of your media into a file:
```
$ find "$(pwd)" -iname "*Your Artist Here*" > Artist.m3u
$ mpvc add Artist.m3u
```
- You can save your current playlist to a file for later playback:
```
$ mpvc save myPlaylist
Adding files to myPlaylist.m3u...
```
- You can specify default player options directly through mpv.conf:
```
volume=70
loop-playlist
```
- mpvc executes faster ~4x faster when using dash syslinked to /bin/sh instead
of bash. Another faster alternative is mksh.
- mpvc should be fully POSIX compliant, meaning it should run on any unix-like
variant. [Please report an issue if you experience
trouble.](https://github.com/lwilletts/mpvc/issues)

## Limitations

Like any piece of software, mpvc is not perfect:

- mpvc does not resolve individual files in a directory unless it is
  currently in or has been inside that directory, giving misleading results about
  the total number of files in the current playlist. This is a limitation of mpv.
- mpvc depends on shell tools. If your shell is misconfigured or you are using
  unusual variants of basic unix tools, mpvc is not guaranteed to work. However,
  all effort has been made to make mpvc as POSIX compliant as possible.

Check out the [Issue Tracker](https://github.com/wildefyr/mpvc/issues) for
further improvements to be made.
