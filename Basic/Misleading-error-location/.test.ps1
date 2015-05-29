
$v2 = $PSVersionTable.PSVersion.Major -eq 2

# Synopsis: Good error in v2 and v3+
task Test-1-correct-error-location {
	($r = try {.\Test-1-correct-error-location.ps1} catch {$_})
	assert ($r.InvocationInfo.PositionMessage -like '*MissingCommand*')
}

# Synopsis: Good error in v2, misleading in v3+
task Test-2-misleading-error-location {
	($r = try {.\Test-2-misleading-error-location.ps1} catch {$_})
	if ($v2) {
		assert ($r.InvocationInfo.PositionMessage -like '*MissingCommand*')
	}
	else {
		assert ($r.InvocationInfo.PositionMessage -like '*WillThrow*')
	}
}

# Synopsis: How to recover correct error location in v3+
task Test-3-recovering-error-location {
	($r = try {.\Test-3-recovering-error-location.ps1} catch {$_})
	if ($v2) {
		assert ($r[0].InvocationInfo.PositionMessage -like '*MissingCommand*')
		assert ($r[1].InvocationInfo.PositionMessage -like '*MissingCommand*')
	}
	else {
		assert ($r[0].InvocationInfo.PositionMessage -like '*WillThrow*')
		assert ($r[1].InvocationInfo.PositionMessage -like '*MissingCommand*')
	}
}
