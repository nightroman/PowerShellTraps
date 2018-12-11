
$v2 = $PSVersionTable.PSVersion.Major -eq 2
$v3_5 = !$v2 -and $PSVersionTable.PSVersion.Major -le 5
$v610 = $PSVersionTable.PSVersion -gt ([version]'6.0.9999')

task unexpected.start.location -If ($v2 -or $v3_5) {
	if ($v2) {
		($r = ./v2.unexpected.start.location.cmd)
		equals $r[-3].Trim() 'C:\'
	}
	else {
		($r = ./v3.unexpected.start.location.cmd)
		#! ignore case
		assert ($r[-3].Trim() -eq $PSHOME)
	}

	Remove-Item -LiteralPath 'Test [2]'
}

task expected.start.location -If ($v610 -and $env:powershell6) {
	# temporarily set $env:path
	$path0 = $env:path
	$env:path = (Split-Path $env:powershell6) + ';' + $env:path

	# test
	($r = ./v6.1.0.expected.start.location.cmd)

	# v6.2.0-preview.3 -- [-2], was [-3]
	assert ($r[-2].Trim() -match '\\Test \[2\]$')

	# end
	$env:path = $path0
	Remove-Item -LiteralPath 'Test [2]'
}
