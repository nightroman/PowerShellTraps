
task unexpected.output.location {
	remove z, z.*
	$null = mkdir z

	.\unexpected.output.location.ps1

	assert (Test-Path z.expected.Set-Content.log)
	assert (Test-Path z\z.unexpected.Set-Content.log)
	assert (Test-Path z.expected.Out-File.log)

	remove z, z.*
}
