#
# @file socat.ps1
# @description mimic socat over win32 named pipe for mpvc
# @author gmt4 <gmt4 at github.com> (c) Copyright 2022 MIT
# @url github.com/gmt4/mpvc
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

function main()
{
    $input=$args[0]
    $output=$args[1]
    $timeout=1000

    if ($args.length -ne 2 -or $input -ne "-" -or $output -eq $null) {
        return usage
    }

    $pipe = new-object System.IO.Pipes.NamedPipeClientStream(".", $output, "InOut")
    $pipe.Connect($timeout)
    if (-not $pipe.isConnected) {
        return die("# Failed: connect $output")
    }

    $script:reader = new-object System.IO.StreamReader($pipe)
    if (-not $reader) {
        return die("# Failed: reader $output")
    }
    $script:writer = new-object System.IO.StreamWriter($pipe)
    if (-not $writer) {
        return die("# Failed: writer $output")
    }
    $writer.AutoFlush = $true

    while ($iline = read-host)
    {
        $writer.WriteLine($iline)
        $job = Start-Job -ScriptBlock { echo $args.ReadLine() } -ArgumentList $reader
        Wait-Job -Job $job -Timeout 2 | Out-Null
        Receive-Job -Job $job
    }

    $reader.Dispose()
    $writer.Dispose()
    $pipe.Close()
}

main $args[0] $args[1] $args[2]
