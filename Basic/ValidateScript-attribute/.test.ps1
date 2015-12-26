
task Test-1-simple-but-poor-error-message {
	($r = try {.\Test-1-simple-but-poor-error-message.ps1} catch {$_})
	assert ($r -like '*"$_ -match ''^\w+$''"*')
}

task Test-2.1-good-message-but-incorrect {
	($r = try {.\Test-2.1-good-message-but-incorrect.ps1} catch {$_})
	assert ($r -like '*Name should contain alphanumeric letters and "_".*')
}

task Test-2.2-good-message-but-incorrect {
	($r = try {.\Test-2.2-good-message-but-incorrect.ps1} catch {$_})
	assert ($r -like '*if ($_ -notmatch ''^\w+$'')*')
}

task Test-3-correct-and-good-but-not-simple {
	($r = try {.\Test-3-correct-and-good-but-not-simple.ps1} catch {$_})
	equals $r[0] 'Name is valid_name'
	assert ($r -like '*Name should contain alphanumeric letters and "_".*')
}

task Test-4-invoked-for-each-item {
	($r = .\Test-4-invoked-for-each-item.ps1)
	equals 'Validated 1|Validated 2|Validated 3' ($r -join '|')
}

task Test-5-value-cannot-be-null {
	($r = try {.\Test-5-value-cannot-be-null.ps1} catch {$_})
	assert ($r -like '*The argument is null,*')
}
