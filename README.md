# 🎧 mpvc

![GitHub](https://img.shields.io/github/license/lwilletts/mpvc)
![GitHub Release Date](https://img.shields.io/github/release-date/lwilletts/mpvc)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/lwilletts/mpvc)
![GitHub top language](https://img.shields.io/github/languages/top/lwilletts/mpvc)
![GitHub lines of Code](https://sloc.xyz/github/lwilletts/mpvc/?category=code)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Fgmt4.github.io%2Fmpvc%2F)](https://gmt4.github.io/mpvc)

An elegant, lightweight, mpc-like command-line and web controller for the mpv media player, built on POSIX shell scripts and Unix sockets.

[🌐 Watch the Demo](https://gmt4.github.io/mpvc/)

## ⚡ Installation

The `mpvc-installer quickstart` automated install runs strictly in user-space (no sudo/root access). If you ever want to remove it, it leaves no messy traces, just do `mpvc-installer quickstart-rm`.


```bash
curl -fsSLO https://github.com/gmt4/mpvc/raw/master/extras/mpvc-installer;
# take your time to review the mpvc-installer for peace-of-mind
BINDIR=$HOME/bin SHELL=/bin/sh $SHELL ./mpvc-installer quickstart
```

*Prefer using package managers like Homebrew, Nix, Pkg, Gentoo, BSD or the Arch AUR? See the **[Detailed Installation steps in docs/README.md](https://github.com/gmt4/mpvc/docs/README.md#installation)**.*

---

## 🚀 Quickstart Guide

Note you can use `m/mx` instead of `mpvc/mpvc-fzf` when typing on the CLI, these are setup by `mpvc-installer`.

### 1. Base Player Controls (mpvc)
```bash
mpvc add https://somafm.com/lush130.pls # Start playing SomaFM lush
mpvc pause                              # Pause playback
mpvc play 0                             # Play playlist entry 0
mpvc vol 30                             # Set volume to 30%
mpvc next                               # Play next track in the playlist

mpvc toggle                             # Toggle playback state (play/pause)
mpvc togglev                            # Toggle video playback state (on/off)
mpvc togglei                            # Toggle idle playback state (once/always/off)
find ~/Music -name "*.mp3" | mpvc load  # Pipe local directories into the active queue
```

### 2. Interactive Search Controls (mpvc-fzf)
```bash
mpvc-fzf -f         # Launch fzf to visually manage your current playlist queue
mpvc-fzf -p 'query' # Search on Invidious/YouTube and stream matching audio
mpvc-fzf --rp       # Instantly search and play live RadioParadise audio feeds
mpvc-fzf --lofi     # Instantly search and play live Lo-Fi audio feeds
mpvc-fzf --somafm   # Browse and stream live background channels from SomaFM
```

### 3. Web Browser Control (mpvc-web)

```bash
mpvc-web -c start       # Start, and open `http://localhost:8888` in your browser
mpvc-web -c start -s1   # Start, and open `https://localhost:8443` in your browser
```

*Looking for high-level script wrappers, playlist stashes, or advanced command examples? Check out the **[Complete Usage Examples in docs/README.md](docs/README.md#git)**.*

---

## 🎛️ Companion Tools

*   **mpvc:** Core CLI interface for absolute playback, queue sequencing, and scripting.
*   **mpvc-fzf:** Interactive fuzzy-finder integration to look up tracks and stream streams.
*   **mpvc-tui:** Terminal-user-interface console to display tracks and desktop notifications.
*   **mpvc-web:** web-based-interface to manage mpvc from any device running web-browser.

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

Documentation can be found in the repo, man pages, FAQ, README, and dev log:

Repo
: [https://github.com/gmt4/mpvc](https://github.com/gmt4/mpvc)

Manpages
: [https://gmt4.github.io/mpvc/man/man1/](https://gmt4.github.io/mpvc/man/man1/)

Logbook
: [https://gmt4.github.io/mpvc/logbook.html](https://gmt4.github.io/mpvc/logbook.html)

FAQ
: [https://github.com/gmt4/mpvc/docs/FAQ.md](docs/FAQ.md)

## Issues

If you encounter a bug file an [Issue](../../issues).

## Ecosystem Architecture

The following diagram maps how media inputs flow down through the user-facing tools, core scripts, and runtime configuration layers to drive the underlying playback engine:

```mermaid
graph TD
    %% Layer 0: Media Sources
    subgraph L0 [Layer 0: Media Sources]
        direction LR
        local[Local FS<br>~/Music] --- cache[Local Cache<br>ytdl-archive] --- feeds[FZF Feeds<br>Radio APIs] --- lan[LAN Peers<br>mpvc-web] --- streams[URL Streams<br>YT/Bandcamp]
    end

    %% Layer 1: User Interfaces
    subgraph L1 [Layer 1: User-Facing Tools]
        direction LR
        tui[mpvc-tui] --- fzf[mpvc-fzf] --- web[mpvc-web] <--> cgi[mpvc-web-browser]
    end

    %% Layer 2: Core Logic & Helpers
    subgraph L2 [Layer 2: Core Script & Helpers]
        direction LR
        mpvc[mpvc CLI] --- eq[mpvc-equalizer] --- ch[mpvc-chapter]
    end

    %% Layer 3: Communication Bridge & Global Config
    subgraph L3 [Layer 3: Unix Socket & Config Global]
        direction LR
        conf[mpvc.conf] -. Sourced by scripts .-> socket[~/.config/mpvc/mpvsocket]
    end

    %% Layer 4: Media Engine
    subgraph L4 [Layer 4: Media Engine]
        direction LR
        mpv[mpv Player<br>mpv.conf] <--> ytdl[yt-dlp<br>yt-dlp.conf]
    end

    %% Flow Connections
    L0 --> L1
    L1 <--> L2
    L2 <--> conf
    socket <--> L4

    %% Styling for crisp rendering
    style L0 fill:none,stroke:#d48427,stroke-dasharray: 5 5
    style L1 fill:none,stroke:#388bfd,stroke-dasharray: 5 5
    style L2 fill:none,stroke:#238636,stroke-dasharray: 5 5
    style L3 fill:none,stroke:#8b949e,stroke-dasharray: 5 5
    style L4 fill:none,stroke:#8957e5,stroke-dasharray: 5 5

    classDef default fill:#1f232a,stroke:#30363d,color:#c9d1d9,stroke-width:1px;
    classDef config fill:#161b22,stroke:#d48427,color:#e3b341,stroke-width:1px;

    class local,cache,feeds,lan,streams,tui,fzf,web,cgi,mpvc,eq,ch,socket,mpv,ytdl default;
    class conf config;
```

