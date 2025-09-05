# FAQ

Contribute answers in a `Q: A:` format to your favorite Frequently Asked Questions.

## BSD support?

The current focus is on GNU/Linux OSes, however as BSD is a UNIX system support is easy thanks to [pkg(1)](https://man.freebsd.org/cgi/man.cgi?pkg):


    pkg install -y mpv curl socat fzf rlwrap jq libnotify # gawk gsed

⚠️ *Note*. When installing mpvc on BSD remember that BSD ships with different commands from the standard ones found in GNU/Linux. Since mpvc is targeted at GNU/Linux, mpvc expects its GNU command versions, instead of the BSD versions, like, ksh(1), sed(1), awk(1) etc. So, for now, in case of error, ensure that mpvc picks the GNU versions of the commands (easy to do by giving them preference on PATH).

## Mac support?

The current focus is on GNU/Linux OSes, yet mpvc support on Mac is easy thanks to [brew](https://brew.sh/):

    brew install mpv socat fzf rlwrap jq yt-dlp # gawk gnu-sed

⚠️ *Note*. When installing mpvc on Mac remember that macOS ships the BSD versions of sed, awk, etc that differ from the GNU/Linux ones, therefore be sure to read [BSD support](#bsd-support)

## Windows support?

The current focus is on UNIX/Linux OSes, supporting Windows is out of scope ATM.
Your best aim for using mpvc under Windows is to follow mpv documentation: [https://mpv.io/manual/master/#command-prompt-example](https://mpv.io/manual/master/#command-prompt-example)
- First, step should be installing Cygwin/MSYS2 and mpv.
- Second, step should be getting mpvc.
- Third, should be getting a socat (see [socat.ps1](https://github.com/gmt4/mpvc/blob/master/extras/win32/socat.ps1)) replacement command under windows to perform read/write on the `MPVC_SOCKET` named pipe used by mpv/mpvc.
- Last, AFAIK nobody has got to this point, so if somebody gets mpvc working on windows, report back, and update this. 

## MPRIS support?

* Check the [logbook](https://gmt4.github.io/mpvc/logbook.html#logbook-20240214) for howto setup.

## Screenshots

mpvc-fzf running on macOS:
![mpvc-fzf on macOS](https://raw.githubusercontent.com/gmt4/mpvc/master/docs/assets/mpvc-fzf-mac.jpg)
