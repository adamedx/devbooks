if ( $args.length -ne 2 -and $args.length -ne 4)
{
    echo "Usage: "
    echo "    authtest.ps1 `<winrm-command`> `<dest-address`> [`<username`> `<password`>]"
    exit 1
}
echo "Starting authtest scenarios for winrm..."
echo ([System.DateTime]::Now)

$forecolor = (get-host).UI.RawUI.Foregroundcolor

(get-host).UI.RawUI.Foregroundcolor = "Yellow"
echo "Executing auth trace tests"
(get-host).UI.RawUI.Foregroundcolor = $forecolor

$osversion = [System.Environment]::OSVersion.Versionstring

(get-host).UI.RawUI.Foregroundcolor = "magenta"
echo "Operating System: $osversion"
(get-host).UI.RawUI.Foregroundcolor = $forecolor

echo "Setting trusted hosts to all"
si wsman:\localhost\client\trustedhosts '*' -force

$remotecommand = $args[0]
$commandargs = $args[1]
if ( $args.length -gt 3 )
{
    $commandargs = $commandargs  + " " + $args[2] + " '" + $args[3] + "'"
}

$authtracedir="c:\ssptraces"

echo "Starting ntlm and kerb logging"

pushd $authtracedir
& $authtracedir\startntlmtrace.cmd
& $authtracedir\startkerbtrace.cmd
popd

echo "Starting wsman tracing"
Enable-wsmantrace

echo "About to execute scenario: $remotecommand"

$invalidarg = $false

if ($remotecommand -eq 'sleep')
{
    echo "sleep $commandargs"
    sleep $commandargs
}
elseif ($remotecommand -eq 'winrs')
{
    echo ("winrs -r:{0} -u:{1} -p:{2} 'ipconfig'" -f $args[1], $args[2], $args[3])
    winrs -r:$args[1] -u:$args[2] -p:$args[3] 'ipconfig'
}
elseif ($remotecommand -eq 'knife')
{
    echo ("knife winrm -m {0} -x {1} -P '{2}' 'ipconfig'" -f $args[1], $args[2], $args[3])
    knife winrm -m $args[1] -x $args[2] -P $args[3] 'ipconfig'
}
else
{
    $invalidarg = $true
}

$remotecommandstatus = $LASTEXITCODE

if ( $invalidarg -eq $true ) { $remotecommandstatus = 87 }

echo "Remote command completed with status $remotecommandstatus"

echo "Stopping wsman tracing"
disable-wsmantrace

echo "Stopping ntlm and kerb logging"
pushd $authtracedir
& $authtracedir\stopntlmtrace.cmd
& $authtracedir\stopkerbtrace.cmd
popd

echo "Test finished."
echo "Please see wsman traces in $env:windir\system32\wsmtraces.log"
echo "and ntlm / kerb traces in $authtracedir\ntlm.etl and $authtracedir\kerb.etl"
echo ([System.DateTime]::Now)
if ($remotecommandstatus -eq 0)
{
    (get-host).UI.RawUI.Foregroundcolor = "green"
    echo "Succeeded"
    (get-host).UI.RawUI.Foregroundcolor = $forecolor        
}
else
{
    write-error "Failed with error $remotecommandstatus"
    exit $remotecommandstatus
}