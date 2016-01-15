mpvc
====

An mpc-like control interface for mpv.

![ExampleOutput](https://github.com/Wildefyr/mpvc/blob/master/exampleOutput.png)

Dependencies
------------

- bc
- awk (sadly)
- socat 
- A sane unix environment

Install
-------

Copy mpvc to somewhere on your $PATH.

Usage
-----

```
Usage: mpvc ARGUMENTS
    -S : Set socket location [default: /tmp/mpvsocket].
    -s : Increase/decrease time in seconds.
    -t : Set absolute time in seconds.
    -v : Set absolute volume.
    -V : Set absolute volume.
    -f : Go forwards/backwards through the playlist queue.
    -F : Jump to playlist item number.
    -z : Increase/decrease speed.
    -Z : Set absolute speed.
    -p : Toggle play/paused.
    -m : Toggle mute/unmuted.
    -l : Loop currently playing file.
    -L : Loop currently playing playlist.
    -T : Print Elasped Time in HH:MM:SS format to stdout.
    -k : Kill the current mpv process controlling the named socket.
    -h : Print this help.

Exit codes:
     0 : Program ran succesfully.
     1 : Input Argument error.
     2 : Socket does not exist.
     3 : Socket is not currently open.
     4 : Socat is not installed.
```

mpv must also be started with the following argument:

`mpv --input-unix-socket=/tmp/mpvsocket`

I personally alias that in my shell's configuration file like so:

`alias mpv --input-unix-socket=/tmp/mpvsocket`

While /tmp/mpvsocket is the default location, any mpv socket can be specified
with the use of the -S flag when calling mpvc.

TODO
----

- Implement format options similarly to mpc.
- Implement long options in the style of mpc.
- Implement using GNU netcat as an alternative to socat.
- Perhaps offer a Makefile to install the script to the user's $PATH.

Shameless Plug
--------------

If you want to contact me about anything, my website can be found
[here](http://wildefyr.net) and I can also be found on the Freenode IRC under
the nick 'Wildefyr' where I am often found in #crux and #6c37. If you're
feeling particularly kind of heart, star this repository and/or follow me.
