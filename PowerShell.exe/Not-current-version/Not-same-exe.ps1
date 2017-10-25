
$Version = $PSVersionTable.PSVersion.Major
$IsV6Core = $Version -ge 6 -and $PSVersionTable.PSEdition -eq 'Core'
if (!$IsV6Core) {
	Write-Warning 'This test is for v6 Core on a Windows machine'
	return
}

# v6-beta.6 This invokes the current desktop version
# v6-beta.7 Fixed, the Core is called
# v6-beta.9 The problem changed due to renamed pwsh.exe
powershell.exe -NoProfile -Command '$PSVersionTable.PSVersion.ToString()'

# Ensure the same exe
$exe = (Get-Process -Id $PID).Path
& $exe -NoProfile -Command '$PSVersionTable.PSVersion.ToString()'
