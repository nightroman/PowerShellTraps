
$v2 = $PSVersionTable.PSVersion.Major -eq 2

task Test-1-1-original-case-normal {
	($r = .\Test-1-1-original-case-normal.ps1)
	if ($v2) {
		assert ($null -eq $r)
	}
	else {
		assert('Processed 1|Processed 2|Processed 3' -eq $r -join '|')
	}
}

task Test-1-2-original-case-strict {
	($r = try {.\Test-1-2-original-case-strict.ps1} catch {$_})
	if ($v2) {
		assert ('PropertyNotFoundStrict' -eq $r.FullyQualifiedErrorId)
	}
	else {
		assert('Processed 1|Processed 2|Processed 3' -eq $r -join '|')
	}
}

task Test-1-3-safer-approach {
	($r = .\Test-1-3-safer-approach.ps1)
	assert ($null -eq $r)
}

task Test-2-1-noise-data-normal {
	($r = .\Test-2-1-noise-data-normal.ps1)
	if ($v2) {
		assert('False|False' -eq $r -join '|')
	}
	else {
		assert('True|True' -eq $r -join '|')
	}
}

task Test-2-2-noise-data-strict {
	($r = try {Test-2-2-noise-data-strict.ps1} catch {$_})
	assert ('CommandNotFoundException' -eq $r.FullyQualifiedErrorId)
}
