
$Version = $PSVersionTable.PSVersion.Major
$IsV6Core = $Version -ge 6 -and $PSVersionTable.PSEdition -eq 'Core'
if (!$IsV6Core) {
	Write-Warning 'This test is for v6 Core on a Windows machine'
	return
}

# This invokes the current desktop version
PowerShell -NoProfile '$PSVersionTable.PSVersion.ToString()'

# Ensure the same exe
$exe = (Get-Process -Id $PID).Path
& $exe -NoProfile '$PSVersionTable.PSVersion.ToString()'
