
# v5: fails "cannot auto-load the module" if called as -File
if ($PSVersionTable.PSVersion.Major -eq 5) { Import-Module Microsoft.PowerShell.Utility }

function Test-Preference {
    # set an invalid value
    $VerbosePreference = 'Invalid'

    # not written (SilentlyContinue)
    Write-Verbose Message
}

$VerbosePreference = 'Stop'
Test-Preference

'Done.'
