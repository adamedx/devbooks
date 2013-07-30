if ( $args.length -lt 3 )
{
    echo "Usage: "
    echo "    clienttestwinrs.ps1 `<dest-address`> `<username`> `<password`>"
    exit 1
}


.\authtest.ps1 winrs $args[0] $args[1] $args[2]