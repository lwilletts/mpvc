mpvc
====

An mpc-like control interface for mpv.

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
    [Crux](https://github.com/6c37/crux-ports-git)

If you have packaged mpvc for your distribution, let me know so I can add it here.

Manual Install
--------------

Either use the makefile I have provided or copy mpvc somewhere to your $PATH.

Usage
-----

```
Usage: mpvc [-S "socket"] [-a "filenames"] "[-f "format string"]
    -S : Set socket location [default: $SOCKET].
    -q : Produce no textual output.
    -f : Enter a format string.
    -a : Add files to current playlist. This cannot be combined with another option.
    -i : Print all filenames of tracks in current playlist.
    -s : Increase/decrease time in seconds.
    -t : Set absolute time in seconds.
    -v : Increase/decrease volume relatively to the current volume.
    -V : Set absolute volume.
    -r : Go forwards/backwards through the playlist queue.
    -R : Jump to playlist item number.
    -x : Increase/decrease speed relatively to the current speed.
    -X : Set absolute speed.
    -p : Toggle play/paused.
    -m : Toggle mute/unmuted.
    -l : Loop currently playing file.
    -L : Loop currently playing playlist.
    -z : Shuffle the current playlist.
    -k : Kill the current mpv process controlling the given socket.
    -K : Kill all mpv processes found.
    -h : Print this help.

Formatting:
    mpvc will interpret the following delimiters if they are found:

    %filename%, %title%, %artist%, %album%, %albumartist%, %genre%, %year%
    %status%, %time%, %precisetime%, %length%, %percentage%, %speed%
    %playlist%, %position%, %repeat%, %single%
    %volume%, %muted%
    %frame%

Exit codes:
     0: Program ran succesfully.
     1: Input Argument error.
     2: Socket does not exist.
     3: Socket is not currently open.
```

While /tmp/mpvsocket is the default socket location, any mpv socket can be
specified with the use of the -S flag when calling mpvc.

mpv must also be started with the following argument:

```bash
mpv --input-unix-socket=/tmp/mpvsocket
```

You can alias with something like this in your shell's configuration file like so:

```bash
alias mpvt --input-unix-socket=/tmp/mpvsocket --really-quiet
```

Alternatively, you can add the following to your ~/.config/mpv/mpv.conf file.
However, the socket would loaded for any mpv instance:

```bash
input-unix-socket=/tmp/mpvsocket
```

I recommend looking at something like [sxhkd](https://github.com/baskerville/sxhkd)
to bind mpvc calls to key combinations.

Useful Tricks
-------------

Most of the options can be used in combination with each other freely. The
only exception is the -a command. 

To stop playback ala mpc style, try:

```bash
mpvc -p -t 0
```

To decrease the relative values of the playback-time, volume or track
position, append a minus symbol to the value:

```bash
mpvc -v -10
```

The -r option can be used to skip however many tracks in a direction, so long
as it's in the playlist's range:

```bash
mpvc -r 5
```

The -r option can also be combined with -P to always start playing a file
after it's changed.

```bash
mpvc -r 1 -P
```

TODO
----

- [x] Implement format options similarly to mpc.
- [x] Offer option to show all tracks in current queue.
- [x] Offer option to add tracks to the end of the current queue.
- [x] Offer a Makefile to install the script to the user's $PATH.
- [ ] Implement using GNU netcat as an alternative to socat.
- [ ] Implement long options in the style of mpc && replace getopts entirely.

Shameless Plug
--------------

If you want to contact me about anything, my website can be found
[here](http://wildefyr.net) and I can also be found on the Freenode IRC under
the nick 'Wildefyr' where I am often found in #crux and #6c37. If you're
feeling particularly kind of heart, star this repository and/or follow me.
