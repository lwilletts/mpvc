::
:: @file socat.bat
:: @description mimic socat over win32 named pipe for mpvc
:: @author gmt4 <gmt4 at github.com> (c) Copyright 2022 MIT
:: @url github.com/gmt4/mpvc
::

@echo off
powershell.exe -NoProfile -File "%~dp0\socat.ps1" "" "%2"
