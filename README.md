mpvc
====

An mpc-like control interface for mpv.

![ExampleOutput](https://github.com/Wildefyr/mpvc/blob/master/output.png)

Dependencies
------------

- bc
- socat
- A sane unix environment

Install
-------

Copy mpvc to somewhere on your $PATH.

Usage
-----

```
Usage: $(basename $0) [-S socket] [-k] [-qistvVrRzZpmlLh] [-a "filenames]" "[-f "format string"]
    -S : Set socket location [default: $SOCKET].
    -q : Produce no textual output.
    -f : Enter a format string (see Formatting).
    -a : Add filenames to current, or new, playlist.
    -i : Print all filenames of tracks in current playlist.
    -s : Increase/decrease time in seconds.
    -t : Set absolute time in seconds.
    -v : Increase/decrease volume relatively to the current volume.
    -V : Set absolute volume.
    -r : Go forwards/backwards through the playlist queue.
    -R : Jump to playlist item number.
    -z : Increase/decrease speed relatively to the current speed.
    -Z : Set absolute speed.
    -p : Toggle play/paused.
    -m : Toggle mute/unmuted.
    -l : Loop currently playing file.
    -L : Loop currently playing playlist.
    -k : Kill the current mpv process controlling the named socket.
    -h : Print this help.

Formatting:
    $(basename $0) will interpret the following delimiters if they are found:
        %filename%
        %year%
        %genre%
        %title%
        %album%
        %artist%
        %albumartist%
        %time%
        %length%
        %percentage%
        %status%
        %position%
        %playlist%
        %speed%
        %volume%
        %muted%
        %repeat%
        %single%

Exit codes:
     0 : Program ran succesfully.
     1 : Input Argument error.
     2 : Socket does not exist.
     3 : Socket is not currently open.
```

While /tmp/mpvsocket is the default socket location, any mpv socket can be
specified with the use of the -S flag when calling mpvc.

mpv must also be started with the following argument:

```bash
mpv --input-unix-socket=/tmp/mpvsocket`
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
to bind mpvc calls to hotkeys.

TODO
----

- [x] Implement format options similarly to mpc.
- [x] Offer option to show all tracks in current queue.
- [x] Offer option to add tracks to the end of the current queue.
- [ ] Offer a Makefile to install the script to the user's $PATH.
- [ ] Implement using GNU netcat as an alternative to socat.
- [ ] Implement long options in the style of mpc.

Shameless Plug
--------------

If you want to contact me about anything, my website can be found
[here](http://wildefyr.net) and I can also be found on the Freenode IRC under
the nick 'Wildefyr' where I am often found in #crux and #6c37. If you're
feeling particularly kind of heart, star this repository and/or follow me.
