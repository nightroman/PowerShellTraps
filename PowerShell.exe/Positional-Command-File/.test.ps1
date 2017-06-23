
$Version = $PSVersionTable.PSVersion.Major

task Test-1.v5.works.v6.fails {
	($r = ./Test-1.v5.works.v6.fails.ps1)
	$global:LASTEXITCODE
	if ($Version -ge 6) {
		assert ($global:LASTEXITCODE -ne 0)
	}
	else {
		equals $global:LASTEXITCODE 0
	}
}

task Test-2.v6.works.v5.fails {
	($r = ./Test-2.v6.works.v5.fails.ps1)
	$global:LASTEXITCODE
	if ($Version -ge 6) {
		equals $global:LASTEXITCODE 0
	}
	else {
		assert ($global:LASTEXITCODE -ne 0)
	}
}
