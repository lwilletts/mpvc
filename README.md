mpvc
====

An mpc-like control interface for mpv.
mpvc also has a *nearly* complete compatibility layer for mpc commands. See the
mpc manpage for details.

![ExampleOutput](https://github.com/Wildefyr/mpvc/blob/master/output.png)

Dependencies
------------

- mpv
- socat

Optional:
- bc - To control playback speed.

Install
-------

Distribution Packages:
- [Arch](https://aur.archlinux.org/packages/mpvc-git) - `pacaur -y mpvc-git`
- [Crux](https://github.com/6c37/crux-ports-git) - `prt-get depinst mpvc`

If you have packaged mpvc for your distribution, let me know so I can add it here.

Manual Install
--------------

Either use the Makefile I have provided or copy mpvc somewhere to your $PATH.

Usage
-----

For mpvc to work, mpv must be started with the following argument:

```bash
mpv --input-unix-socket=/tmp/mpvsocket $FILES
```

You *could* add the following to your mpv.conf file, but then socket would be
loaded with every instance of mpv by default, but might cause issues as you
will corrupt the socket if two mpv instances are loaded at the same time with
it:

```bash
input-unix-socket=/tmp/mpvsocket
```

Alternatively and probably preferably, mpvc can be used with the -a or --add
option to add files into the playlist.

Useful Tricks
-------------

- Using the `find` command like so: `mpvc -a $(find -type f)` might give you
  better results as it'll list all files in the tree from your current
  position (This is incredibly hard to implement with a non-newline input with
  shell).
- Any URL that is newline separated and resolvable by mpv and/or youtube-dl
  can be added to the playlist, i.e. using
  [mps-youtube](https://github.com/mps-youtube/mps-youtube) with `player` set
  to mpvc and `playerargs` set to add.
- Options can be combined together to give improved result i.e. `mpvc -P -r 1`
  to always start playback when switching to the next track.
- I recommend looking at something like [sxhkd](https://github.com/baskerville/sxhkd)
  to bind mpvc commands to key combinations.

TODO
----

See the [Issue Tracker](https://github.com/wildefyr/mpvc/issues)

Shameless Plug
--------------

If you want to contact me about anything, my website can be found
[here](https://wildefyr.net) and I can also be found on the Freenode IRC under
the nick 'Wildefyr' where I am often found in #crux and #6c37. If you're
feeling particularly kind of heart, star this repository and/or follow me.
