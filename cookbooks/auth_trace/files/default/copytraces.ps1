if ( $args.length -ne 1 )
{
    echo "Usage:"
    echo "    copytraces `<destination`>"
    exit 1
}

$destdir = $args[0]

$authtracedir="c:\ssptraces"
$wsmanlogpath="$env:windir\system32\wsmtraces.log"

mkdir -f $destdir

cp $authtracedir\ntlm.etl $destdir
cp $authtracedir\kerb.etl $destdir

cp $wsmanlogpath $destdir

