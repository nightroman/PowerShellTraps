
function Test-Preference {
    # set an invalid value
    $DebugPreference = 'Invalid'

    # not written (SilentlyContinue)
    Write-Debug Message
}

$DebugPreference = 'Stop'
Test-Preference

'Done.'
