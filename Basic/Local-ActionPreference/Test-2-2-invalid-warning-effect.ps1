
#! 7.2.1 outputs some Ansi rendering chars, suppress for testing
if ($PSVersionTable.PSVersion.Major -ge 7) {
	$PSStyle.OutputRendering = 'PlainText'
}

function Test-Preference {
    # set an invalid value
    $WarningPreference = 'Invalid'

    # written (Continue)
    Write-Warning Message
}

$WarningPreference = 'Stop'
Test-Preference

'Done.'
