
. ../../../Tools.ps1
$Version = $PSVersionTable.PSVersion.Major

task Test-1 {
	($r = Invoke-PowerShell .\Test-1.ps1)
	$r = $r -join '//'
	assert ($r -match $LogPattern)
}

### v5
$LogPattern = if ($Version -ge 5) {
	[regex]@'
(?x)
Transcript \s started, .*?//
LOG-BEGIN//
some \s work//
LOG-END//
Stop-Transcript.*?//
.*?
InvalidOperation,Microsoft.PowerShell.Commands.StopTranscriptCommand//
.*?
Transcript \s started, .*?//
LOG-BEGIN//
some \s work//
  ## LOG-END is missing
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*//
Windows \s PowerShell \s transcript \s end
'@
}
### v2, v3, v4
# Yet another issue: the log contains the header and footer but data are
# missing between them. NOTE: This issue is specific to the test, normal
# scripts are fine.
else {
	[regex]@'
(?ix)
Transcript \s started, .*?//
LOG-BEGIN//
some \s work//
LOG-END//
Transcript \s stopped, .*?//
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*//
  ## our data are missing
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*//
Windows \s PowerShell \s transcript \s end
'@
}
