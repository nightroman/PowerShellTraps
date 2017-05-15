
# Invokes powershell.exe with the current version.
function Invoke-PowerShell {
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		PowerShell.exe -Version 2 -NoProfile @args
	}
	else {
		$exe = (Get-Process -Id $PID).Path
		& $exe -NoProfile @args
	}
}
