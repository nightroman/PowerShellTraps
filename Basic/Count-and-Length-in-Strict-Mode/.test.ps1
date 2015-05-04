
# v3+
if ($PSVersionTable.PSVersion.Major -le 2) {return task SkipV2}

task count.works {
	($r = .\count.works.ps1)
	assert ($r -eq 1)
}

task count.fails {
	($r = try {.\count.fails.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'PropertyNotFoundStrict')
}

task length.works {
	($r = .\length.works.ps1)
	assert ($r -eq 1)
}

task length.fails {
	($r = try {.\length.fails.ps1} catch {$_})
	assert ($r.FullyQualifiedErrorId -eq 'PropertyNotFoundStrict')
}
