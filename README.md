mpvc
====

An mpc-like control interface for mpv.

![ExampleOutput](https://github.com/Wildefyr/mpvc/blob/master/exampleOutput.png)

Dependencies
------------

- socat 
- bc
- A sane unix environment

Install
-------

Copy mpvc to somewhere on your $PATH.

How to use
----------

mpv must be started with the following arguments:

`mpv --input-unix-socket=/tmp/mpvsocket`

I recommend add that as an alias in your shell's configuration file.
/tmp/mpvsocket is the default location, but any mpv socket can be specified
with the use of the -S flag when running mpvc.

TODO
----

- Fix SetSpeedRelative.
- Add long options in the style of mpc.

Shameless Plug
--------------

If you want to contact me about anything, my website can be found
[here](http://wildefyr.net) and I can also be found on the Freenode IRC under
the nick 'Wildefyr' where I am often found in #crux and #6c37.
