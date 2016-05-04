# mpvc

An mpc-like control interface for mpv.

mpvc also has a *nearly* complete compatibility layer for mpc commands in
addition to GNU-style arguments.

[Check the mpc manpage for details.](http://linux.die.net/man/1/mpc)

![ExampleOutput](https://github.com/Wildefyr/mpvc/blob/master/output.png)

## Dependencies

- `mpv`
- `socat` / `nc` (netcat)
- `seq` / `jot`

## Install

Distribution Packages:
- [Arch](https://aur.archlinux.org/packages/mpvc-git) - `pacaur -y mpvc-git`
- [Crux](https://github.com/wildefyr/wild-crux-ports) - `prt-get depinst mpvc`

If you have packaged mpvc for your distribution, let me know so I can add it here.

#### Manual Install

Use the Makefile provided or copy mpvc somewhere to your $PATH.

## Usage

For mpvc to work, mpv must be started with the following argument:

`
$ mpv --input-unix-socket=/tmp/mpvsocket song.flac
`

Alternatively and probably preferably, mpvc can be used with the -a or --add
option to add files to the current playlist:

`
$ mpvc -a *
`

However, mpv does not resolve individual files in a directory unless it is
currently in or has been inside that directory, giving misleading results about
the total number of files in the current playlist. A handy alternative is to use
`find` to pipe files directly into mpvc:

`
$ find . -type f | mpvc
`

You *could* use a subshell, but it won't phrase files with spaces in them
correctly. ( It's very hard to phrase this correctly :( )

## Useful Tricks

- Hotkey daemons like [sxhkd](https://github.com/baskerville/sxhkd)
  can be used to bind mpvc commands to key combinations.
- Any URL that is resolvable by mpv and/or youtube-dl can be added to the
  playlist, i.e. using [mps-youtube](https://github.com/mps-youtube/mps-youtube)
  with `player` set to mpvc and `playerargs` set to add.
- Multiple options can be combined together to give improved result:

`
$ mpvc -P -j 1
`

- This will make mpvc always start playing when switching to the next track.

## TODO

Check out the [Issue Tracker](https://github.com/wildefyr/mpvc/issues)

## Shameless Plug

If you want to contact me about anything, my website can be found
[here](https://fyrious.ninja) and I can also be found on the Freenode IRC under
the nick 'Wildefyr' where I am often found in #crux and #6c37. If you're
feeling particularly kind of heart, star this repository and/or follow me.
