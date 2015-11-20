
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1.GetItemWithDrive {
	$r = try {
		.\Test-1.GetItemWithDrive.ps1
	}
	catch {
		$_.FullyQualifiedErrorId
	}

	($r = $r -join '|')
	if ($v2) {
		assert $r.Equals('C:\|HKEY_CURRENT_USER|Argument,Microsoft.PowerShell.Commands.GetItemCommand')
	}
	else {
		assert $r.Equals('C:\|HKEY_CURRENT_USER|True')
	}
}

task Test-2.GetItemWithDot {
	$r = try {
		.\Test-2.GetItemWithDot.ps1
	}
	catch {
		$_.FullyQualifiedErrorId
	}

	($r = $r -join '|')
	if ($v2) {
		assert $r.Equals('C:\|HKEY_CURRENT_USER|Argument,Microsoft.PowerShell.Commands.GetItemCommand')
	}
	else {
		assert $r.Equals('C:\|HKEY_CURRENT_USER|True')
	}
}

task Test-3.GetItemWithSlash {
	$r = try {
		.\Test-3.GetItemWithSlash.ps1
	}
	catch {
		$_.FullyQualifiedErrorId
	}

	($r = $r -join '|')
	if ($v2) {
		assert $r.Equals('C:\|HKEY_CURRENT_USER|Argument,Microsoft.PowerShell.Commands.GetItemCommand')
	}
	else {
		assert $r.Equals('C:\|HKEY_CURRENT_USER|True')
	}
}
