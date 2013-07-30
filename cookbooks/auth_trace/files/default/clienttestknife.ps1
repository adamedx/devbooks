if ( $args.length -lt 3 )
{
    echo "Usage: "
    echo "    clienttest.ps1 ``<dest-address`> `<username`> `<password`>"
    exit 1
}

.\authtest.ps1 knife $args[0] $args[1] $args[2]