
$VersionInstalled = PowerShell.exe -NoProfile '$PSVersionTable.PSVersion.Major'
$VersionRunning = $PSVersionTable.PSVersion.Major

task Test-1 -If ($VersionInstalled -eq 5) {
	($r = PowerShell.exe -Version $VersionRunning -NoProfile .\Test-1.ps1)
	$r = $r -join '//'
	assert ($r -match $LogPattern)
}

### v5 running
$LogPattern = if ($VersionRunning -eq 5) {
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
### v2 running in v5
# ?? Yet another issue in v5: the log file contains the header and footer but
# our data are missing between them. NOTE: This issue is shown by this exact
# test, it is not shown in a standard script scenario.
elseif ($VersionInstalled -eq 5) {
	equals $VersionRunning 2
	[regex]@'
(?x)
Transcript \s started, .*?//
LOG-BEGIN//
some \s work//
LOG-END//
Transcript \s stopped, .*?//
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*//
  ## our data are missing
\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*//
Windows \s PowerShell \s Transcript \s End
'@
}
