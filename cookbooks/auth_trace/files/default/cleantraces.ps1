$wsmanlogpath="$env:windir\system32\wsmtraces.log"

@("$authtracedir\ntlm.etl,$wsmanlogpath","$authtracedir\kerb.etl") | foreach { 
    if ( test-path $_ )
    {
        rm $_
    }
}

