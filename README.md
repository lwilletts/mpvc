# 🎧 mpvc

![GitHub](https://img.shields.io/github/license/lwilletts/mpvc)
![GitHub Release Date](https://img.shields.io/github/release-date/lwilletts/mpvc)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/lwilletts/mpvc)
![GitHub top language](https://img.shields.io/github/languages/top/lwilletts/mpvc)
![GitHub lines of Code](https://sloc.xyz/github/lwilletts/mpvc/?category=code)

[ [Intro](#%EF%B8%8F-overview-1) | [Reqs](#requirements) | [Install](#installation) | [Config](#configuration) | [Docs](#documentation) | [Usage](#usage) ]

An elegant, lightweight, mpc-like command-line and web controller for the mpv media player, built on POSIX shell scripts and Unix sockets.

## ⚡ Installation

```bash
curl -fsSLO https://github.com/gmt4/mpvc/raw/master/extras/mpvc-installer;
# take your time to review the mpvc-installer for peace-of-mind
BINDIR=$HOME/bin SHELL=/bin/sh $SHELL ./mpvc-installer quickstart
```

*Prefer using package managers like Homebrew, Nix, Pkg, Gentoo, or the Arch AUR? See the **[Detailed Installation steps in docs/README.md](docs/README.md#installation)**.*

---

## 🚀 Quickstart Guide

### 1. Base Player Controls (mpvc)
```bash
mpvc toggle                          # Toggle playback state (play/pause)
mpvc next                            # Skip to the next track in the playlist
mpvc add "https://youtube.com..."    # Stream online media via yt-dlp
find ~/Music -type f -name "*.mp3" | mpvc load    # Pipe local directories into the active queue
```

### 2. Interactive Search Controls (mpvc-fzf)
```bash
mpvc-fzf -f         # Launch fzf to visually manage your current playlist queue
mpvc-fzf -p 'query' # Search on Invidious/YouTube and stream matching audio
mpvc-fzf --lofi     # Instantly search and play live Lo-Fi audio feeds
mpvc-fzf --somafm   # Browse and stream live background channels from SomaFM
```

*Looking for high-level script wrappers, playlist stashes, or advanced command examples? Check out the **[Complete Usage Examples in docs/README.md](docs/README.md#usage)**.*

---

## 🌐 Web Browser Control (mpvc-web)

Start the local control wrapper with `mpvc-web -c start` and open `http://localhost:8888` in your browser. It turns any web browser into a clean media remote control interface without heavy dependencies.

```bash
mpvc-web -c start
# Open `http://localhost:8888` in your browser
```

---

## 🎛️ Companion Tools

*   **mpvc:** Core CLI interface for absolute playback, queue sequencing, and scripting.
*   **mpvc-fzf:** Interactive fuzzy-finder integration to look up tracks and stream streams.
*   **mpvc-tui:** Terminal-user-interface console to display tracks and desktop notifications.

*To see the full breakdown and capabilities of each tool script, read our **[Overview in docs/README.md](docs/README.md#overview)**.*

### Screenshots

<details>
<summary>mpvc-fzf running on macOS <i>(click to view screenshot)</i></summary>

![mpvc-fzf on macOS](../../blob/master/docs/assets/mpvc-fzf-mac.jpg)
</details>

<details>
<summary>mpvc-tui -T: running the mpvc TUI (with albumart) <i>(click to view screenshot)</i></summary>

![mpvc-tui -T screenshot](../../blob/master/docs/assets/mpvc-tui-new.png)
</details>

<details>
<summary>mpvc-tui -T: running the mpvc TUI <i>(click to view screenshot)</i></summary>

![mpvc-tui -T screenshot](../../blob/master/docs/assets/mpvc-tui.png)
</details>

<details>
<summary>mpvc-fzf -f: running with fzf to manage the playlist <i>(click to view screenshot)</i></summary>

![mpvc-fzf screenshot](../../blob/master/docs/assets/mpvc-tui-arch.png)
</details>

<details open>
<summary>mpvc-tui -n: running with mpvc-fzf and desktop notifications on the upper-right corner <i>(click to view screenshot)</i></summary>

![mpvc tui+fzf+notifications screenshot](../../blob/master/docs/assets/mpvc-tui-fzf.png)
</details>

---

## ⚙️ System Requirements

*   **Required:** POSIX-compliant shell (`sh`), `mpv`, `socat`.
*   **Recommended:** `fzf`, `yt-dlp`.

*For package manager setups or troubleshooting tips, consult the **[Prerequisites Guide in docs/README.md](docs/README.md#requirements)**.*

---

## 🛠️ Configuration

Config file located at `~/.config/mpvc/mpvc.conf`.

*For full variable template defaults or configuring backend rules (`mpv.conf` / `yt-dlp.conf`), look over our **[Configuration in docs/README.md](docs/README.md#configuration)**.*

---

## 🗺️ Documentation

Documentation can be found in the man pages, FAQ, README, and dev log:

* [https://gmt4.github.io/mpvc/man/man1/](https://gmt4.github.io/mpvc/man/man1/)
: For the `mpvc` command-line tools read the manual page.

* [docs/FAQ.md](docs/FAQ.md)
: Check the FAQ for any questions left after reading the above docs.

* [https://gmt4.github.io/mpvc/logbook.html](https://gmt4.github.io/mpvc/logbook.html)
: The logbook (blog) is a companion of mpvc that covers mpvc usage & evolution:

* [https://github.com/gmt4/mpvc](https://github.com/gmt4/mpvc)
: The project site at github.

## Issues

If you encounter a bug file an [Issue](../../issues).
