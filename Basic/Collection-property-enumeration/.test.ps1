
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
		assert ($r.FullyQualifiedErrorId -eq 'PropertyNotFoundStrict')
	}
	else {
		assert('Processed 1|Processed 2|Processed 3' -eq $r -join '|')
	}
}

task Test-1-3-safer-approach {
	($r = .\Test-1-3-safer-approach.ps1)
	assert ($null -eq $r)
}
