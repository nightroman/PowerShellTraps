
$Version = $PSVersionTable.PSVersion
${5.1} = [version]'5.1'

task Test-Copy-Item-Exclude {
	($r = .\Test-Copy-Item-Exclude.ps1)
	if ($Version -ge ${5.1}) {
		equals $r test.txt
	}
	else {
		equals ($r -join '|') 'test.log|test.txt'
	}
}
