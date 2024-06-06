#
# @file socat.ps1
# @description mimic socat over win32 named pipe for mpvc
# @author gmt4 <gmt4 at github.com> (c) Copyright 2022 GPLv2+
# @url github.com/gmt4/mpvc
# SPDX-License-Identifier: GPL-2.0-or-later
#

# Disclaimer: this is a kludge written because I could not find any other tool that did the job.

$PROGNAME = $MyInvocation.MyCommand.Name
$PROGVERSION="v1.0 (status:experimental)"
$PROGAUTHOR="gmt4"
$PROGURL="https://github.com/gmt4/mpvc"

function usage()
{
    echo "usage: $PROGNAME - namedpipe # @version $PROGVERSION (c) $PROGAUTHOR $PROGURL"
    Exit(0)
}

function die($msg)
{
    echo "$msg"
    Exit(1)
}

function wr($line)
{
    $writer.WriteLine($line)
    $writer.Flush()
    if ($line.StartsWith("{"))
    {
        echo $reader.ReadLine()
    }
}

function main()
{
    $input=$args[0]
    $infile=$args[1]
    $outfile=$args[2]
    $timeout=100

    if ($args.length -ne 4 -or $infile -eq $null -or $outfile -eq $null) {
        return usage
    }

    $pipe = new-object System.IO.Pipes.NamedPipeClientStream(".", $outfile, "InOut")
    $pipe.Connect($timeout)
    if (-not $pipe.isConnected) {
        return die("# Failed: connect $outfile")
    }

    $script:reader = new-object System.IO.StreamReader($pipe)
    if (-not $reader) {
        return die("# Failed: reader $outfile")
    }
    $script:writer = new-object System.IO.StreamWriter($pipe)
    if (-not $writer) {
        return die("# Failed: writer $outfile")
    }

    $iline="$input"
    if ($iline -ne "")
    {
        wr($iline)
    }
    else
    {
        while ($iline = Read-Host)
        {
            wr($iline)
        }
    }

    $writer.Dispose()
    $reader.Dispose()
    $pipe.Close()
}

main $input $args[0] $args[1] $args[2]
