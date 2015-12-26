
$Version = $PSVersionTable.PSVersion.Major

task Expected.start.location {
	($r = .\Expected.start.location.cmd $Version)
	assert ($r[-3].Trim() -like '*\Unexpected-start-location\Test 1')
	Remove-Item 'Test 1'
}

task Unexpected.start.location {
	($r = .\Unexpected.start.location.cmd $Version)
	if ($Version -eq 2) {
		equals $r[-3].Trim() 'C:\'
	}
	else {
		#! ignore case
		assert ($r[-3].Trim() -eq $PSHOME)
	}
	Remove-Item -LiteralPath 'Test [2]'
}
