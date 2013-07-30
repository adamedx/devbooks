if ( $args.length -lt 1 )
{
    echo "Usage: "
    echo "    servertest.ps1 `<wait-command`> `<duration`>"
    exit 1
}


.\authtest.ps1 sleep $args[0]