---
title: mpvc-installer(1)
section: 1
version: v1.9
date: September, 2026
manual: User Commands
layout: default
---

# NAME

mpvc-installer - Automated deployment, updates, and configuration manager for mpvc

# SYNOPSIS

    usage: mpvc-installer args # @version v1.9 (c) gmt4 https://github.com/gmt4/mpvc
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

# DESCRIPTION

**mpvc-installer** is a dedicated deployment and configuration manager for the **mpvc** ecosystem. Written in POSIX-compliant shell scripting, it automates script downloading, system-wide or user-level symlinking, dependency checks, and default configuration setups.

# COMMANDS

`quickstart`
: Execute an automated initial setup routine designed for first-time users, fetching and configuring assets locally.

`quickstart-rm`
: Cleanly remove all temporary configurations and installations initialized by the quickstart routine.

`check-update`
: Query the remote upstream Git repository to discover available software updates.

`check-reqs`
: Audit the local system `$PATH` environment to ensure that core required tools (`mpv`, `socat`, `gawk`) and extras are installed.

`config`
: Fetch the standard global baseline `mpv` communication parameters and configuration targets.

`config-user`
: Populate local user configuration directories under `BINDIR=~/bin/` with default profiles.

`config-sys`
: Deploy default profiles globally for system-wide access under `/usr/local/bin`.

`fetch-user`
: Fetch and download the standalone script collection directly into the user's execution directory (`~/bin/`).

`link-user`
: Create localized symlinks within `~/bin/` pointing to a manually cloned repository tree.

`install`
: Move and register the application binaries systematically to the universal `/usr/local/bin` folder block.

`uninstall`
: Completely remove systemic application components from `/usr/local/bin`.

`install-user`
: Compile, move, and configure the standalone suite targets for a single local user profile (`~/bin/`).

`install-sys`
: Execute a full administrative installation routing binaries to `/usr/local/bin` (implicitly sets `PREFIX=/usr/local`).

`uninstall-user`
: Discard user-level script mappings and configurations from the local path context.

`uninstall-sys`
: Erase all administrative global binary elements and dependencies from system folders.

# ENVIRONMENT

`BINDIR`
: Explicitly overrides the destination binary folder path during localized setups. Defaults to `$HOME/bin`.

`PREFIX`
: Declares the baseline administrative root pathway prefix for global installations. Defaults to `/usr/local`.

# FILES

`~/.config/mpvc/`
: Destination directory where `config-user` populates the default `mpvc.conf`, `mpv.conf`, and `yt-dlp.conf` blueprints.

# EXAMPLES

Perform a fully automated, standalone setup tracking standard user folder limits:

    mpvc-installer quickstart

Completely purge and clean up environment trails introduced via the quickstart interface:

    mpvc-installer quickstart-rm

Audit your current install for required tools/versions (such as socat or gawk):

    mpvc-installer check-reqs

Extract and mirror the default configuration profile layout assets inside your user profile directory path:

    mpvc-installer config-user

# SEE ALSO

mpv(1),
fzf(1),
yt-dlp(1),
[mpvc(1)](mpvc.html),
[mpvc-fzf(1)](mpvc-fzf.html),
[mpvc-tui(1)](mpvc-tui.html),
[mpvc-web(1)](mpvc-web.html),
[mpvc-index](.),

AUTHOR
======

Manual written by gmt4. See <https://github.com/gmt4/mpvc> for more information.

REPORTING BUGS
==============

Report bugs at: <https://github.com/gmt4/mpvc/issues>

