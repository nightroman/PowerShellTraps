
function Test-Preference {
    # set an invalid value
    $ErrorActionPreference = 'Invalid'

    # written (Continue)
    Write-Error Message
}

$ErrorActionPreference = 'Stop'
Test-Preference

'Done.'
