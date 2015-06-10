
function Test-Preference {
    # set an invalid value
    $VerbosePreference = 'Invalid'

    # not written (SilentlyContinue)
    Write-Verbose Message
}

$VerbosePreference = 'Stop'
Test-Preference

'Done.'
