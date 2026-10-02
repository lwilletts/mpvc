---
title: mpvc-installer(1)
section: 1
version: v1.9
date: September, 2026
manual: User Commands
layout: default
last_modified_date: 2026-09-26
---

NAME
====

mpvc-installer - Automated deployment, updates, and configuration manager for mpvc

SYNOPSIS
========

    usage: mpvc-installer args # @version v1.9 (c) gmt4 https://github.com/gmt4/mpvc
      quickstart     : QuickStart Install for first-time users
      quickstart-rm  : QuickStart Removal for first-time users

      check-update   : Check for updates
      check-reqs     : Check for required packages
      config         : Fetch mpvc config
      config-user    : Fetch mpvc config to BINDIR=/home/user/bin
      config-sys     : Fetch mpvc config to BINDIR=/usr/local/bin
      man            : Fetch mpvc manpages
      man-user       : Fetch mpvc manpages to MANDIR=/home/user/.local/share
      man-sys        : Fetch mpvc manpages to MANDIR=/usr/local/man/man1
      comp-user      : Install shell completions from MANDIR=/home/user/.local/share
      comp-sys       : Install shell completions from MANDIR=/home/user/.local/share

      fetch-user     : Fetch to BINDIR=/home/user/bin
      link-user      : Symlink to BINDIR=/home/user/bin
      install        : Install to BINDIR=/usr/local/bin
      uninstall      : Uninstall from BINDIR=/usr/local/bin
      install-user   : Install to BINDIR=/home/user/bin
      install-sys    : Install to BINDIR=/usr/local/bin (sets PREFIX=/usr/local)
      uninstall-user : Uninstall from BINDIR=/home/user/bin
      uninstall-sys  : Uninstall from BINDIR=/usr/local/bin (sets PREFIX=/usr/local)
    *tips: If unsure where to start, start with: mpvc-installer quickstart

DESCRIPTION
===========

**mpvc-installer** is a dedicated deployment and configuration manager for the **mpvc** ecosystem. Written in POSIX-compliant shell scripting, it automates script downloading, system-wide or user-level symlinking, dependency checks, and default configuration setups.

COMMANDS
========

quickstart
: Automated download, install, config, and setup. Designed for first-time users under user home (`PREFIX=$HOME`).

quickstart-rm
: Cleanup the installation performed by the quickstart routine.

check-update
: Query the remote upstream Git repository to discover available software updates.

check-reqs
: Check the current mpvc installation, checking that required tools/deps are present, and their versions (`mpv`, `socat`, `gawk`).

config
: Fetch the standard global baseline `mpv` communication parameters and configuration targets.

config-user
: Populate local user mpvc configuration directories under `PREFIX=$HOME`.

config-sys
: Deploy default profiles globally for system-wide access under `PREFIX=/usr/local`.

man
: Fetch the centralized core manual page assets from the remote upstream repository.

man-user
: Deploy localized manual pages directly within the user environment path tree (`MANDIR=/home/user/.local/share/man/man1`).

man-sys
: Deploy manual pages globally for system-wide lookup infrastructure (`MANDIR=/usr/local/man/man1`).

comp-user
: Install interactive terminal tab-completion script matrices directly within your user shell profile configs.

comp-sys
: Deploy shell tab-completion profiles globally for system-wide shells.

fetch-user
: Fetch the standalone script directly into the user home (`PREFIX=$HOME`).

link-user
: Create localized symlinks within `~/bin/` pointing to a manually cloned repository tree.

install
: Install the application binaries systematically to the system `PREFIX=/usr/local/`.

uninstall
: Completely remove systemic application components from `PREFIX=/usr/local/`.

install-user
: Install the application binaries systematically to the user home `PREFIX=$HOME`.

install-sys
: Install the application binaries systematically to the system `PREFIX=/usr/local/`.

uninstall-user
: Uninstall the application binaries systematically from user home `PREFIX=$HOME`.

uninstall-sys
: Uninstall the application binaries systematically from the system `PREFIX=/usr/local/`.

ENVIRONMENT
===========

PREFIX
: Set the prefix pointing to the base installation directory. Defaults to `/usr/local`.

BINDIR
: Explicitly overrides the destination binary folder path during localized setups. Defaults to `$PREFIX/bin`.

MANDIR
: Explicitly overrides the destination path for manual pages and shell completions. Defaults to `$PREFIX/share/man` or `$PREFIX/man`.

FILES
=====

`~/.config/mpvc/`
: Destination directory where `config-user` stores the default configurations for: `mpvc.conf`, `mpv.conf`, and `yt-dlp.conf`

`~/.local/share/man/man1/`
: Local folder targets where user manual configurations are isolated when running `man-user`.

EXAMPLES
========

Perform a fully automated, standalone setup tracking standard user folder limits:

    mpvc-installer quickstart

Completely purge and clean up environment trails introduced via the quickstart interface:

    mpvc-installer quickstart-rm

Audit your current install for required tools/versions (such as socat or gawk):

    mpvc-installer check-reqs

Extract and mirror the default configuration profile layout assets inside your user profile directory path:

    mpvc-installer config-user

SEE ALSO
========

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

