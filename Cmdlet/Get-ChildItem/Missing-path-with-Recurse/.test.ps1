
# Error in all versions.
task test1.expected.error {
	($r = try {.\test1.expected.error.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand')
}

# v2: error, as expected.
# v3: no error, no results.
task test2.unexpected.nothing {
	($r = try {.\test2.unexpected.nothing.ps1} catch {$_})
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		assert ($r.FullyQualifiedErrorId -eq 'PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand')
	}
	else {
		assert ($null -eq $r)
	}
}

# v2: error, as expected.
# v3: some unexpected items.
task test3.unexpected.something {
	($r = try {.\test3.unexpected.something.ps1} catch {$_})
	if ($PSVersionTable.PSVersion.Major -eq 2) {
		assert ($r.FullyQualifiedErrorId -eq 'PathNotFound,Microsoft.PowerShell.Commands.GetChildItemCommand')
	}
	else {
		assert ($r.Count -eq 2)

		assert ($r[0].PSIsContainer)
		assert ($r[0].FullName -like '*\z\6d460559-a89d-405c-9782-42bf39b70894')

		assert (!$r[1].PSIsContainer)
		assert ($r[1].FullName -like '*\z\6d460559-a89d-405c-9782-42bf39b70894\6d460559-a89d-405c-9782-42bf39b70894')
	}
}
