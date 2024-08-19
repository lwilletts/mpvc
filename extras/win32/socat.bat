::
:: @file socat.bat
:: @description mimic socat over win32 named pipe for mpvc
:: @author gmt4 <gmt4 at github.com> (c) Copyright 2022 GPLv2+
:: @url github.com/gmt4/mpvc
:: SPDX-License-Identifier: GPL-2.0-or-later
::

@echo off
powershell.exe -NoProfile -File "%~dp0\socat.ps1" "" "%2"
