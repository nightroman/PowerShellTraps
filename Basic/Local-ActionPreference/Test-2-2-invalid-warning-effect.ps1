
function Test-Preference {
    # set an invalid value
    $WarningPreference = 'Invalid'

    # written (Continue)
    Write-Warning Message
}

$WarningPreference = 'Stop'
Test-Preference

'Done.'
