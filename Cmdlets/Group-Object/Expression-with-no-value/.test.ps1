
$Version = $PSVersionTable.PSVersion.Major

task Test-1 {
	$r = try {.\Test-1.ps1} catch {$_}
	equals $r.Count 2
	equals $r[0].Name X

	if ($Version -ge 5) {
		equals $r[1].FullyQualifiedErrorId 'System.NullReferenceException,Microsoft.PowerShell.Commands.GroupObjectCommand'
	}
	elseif ($Version -eq 2) {
		equals $r[1].GetType().Name GroupInfo
	}
	else {
		Write-Warning 'Not tested PS version'
	}
}

task Test-2 {
	$r = try {.\Test-2.ps1} catch {$_}
	equals $r.GetType().Name GroupInfo
}
