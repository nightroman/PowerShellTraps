
function Remove-Temp {
	Remove-Item [z], z.* -Force -Recurse
}

task unexpected.output.location {
	Remove-Temp
	$null = mkdir z

	.\unexpected.output.location.ps1

	assert (Test-Path z.expected.Set-Content.log)
	assert (Test-Path z\z.unexpected.Set-Content.log)
	assert (Test-Path z.expected.Out-File.log)

	Remove-Temp
}
