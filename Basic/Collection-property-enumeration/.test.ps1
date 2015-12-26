
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1-1-original-case-normal {
	($r = .\Test-1-1-original-case-normal.ps1)
	if ($v2) {
		equals $r
	}
	else {
		equals ($r -join '|') 'Processed 1|Processed 2|Processed 3'
	}
}

task Test-1-2-original-case-strict {
	($r = try {.\Test-1-2-original-case-strict.ps1} catch {$_})
	if ($v2) {
		equals 'PropertyNotFoundStrict' $r.FullyQualifiedErrorId
	}
	else {
		equals ($r -join '|') 'Processed 1|Processed 2|Processed 3'
	}
}

task Test-1-3-safer-approach {
	($r = .\Test-1-3-safer-approach.ps1)
	equals $r
}

task Test-2-1-noise-data-normal {
	($r = .\Test-2-1-noise-data-normal.ps1)
	if ($v2) {
		equals ($r -join '|') 'False|False'
	}
	else {
		equals ($r -join '|') 'True|True'
	}
}

task Test-2-2-noise-data-strict {
	($r = try {Test-2-2-noise-data-strict.ps1} catch {$_})
	equals $r.FullyQualifiedErrorId 'CommandNotFoundException'
}
