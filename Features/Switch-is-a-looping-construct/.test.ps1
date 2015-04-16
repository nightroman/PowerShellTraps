
task continue-works-for-switch {
	($r = .\continue-works-for-switch.ps1)
	assert ($r.Count -eq 4)
	assert ($r[3] -eq 'Process 4')
}

task switch-hides-current-item {
	($r = .\switch-hides-current-item.ps1)
	assert ($r.Count -eq 3)
	assert ($r[2] -eq "Word '5' length is not 3.")
}

task use-continue-not-break {
	($r = .\use-continue-not-break.ps1)

	# Test 1
	# - correct result
	# - redundant job is done
	assert (($r.out1 -join ', ') -eq 'this is 1, this is 2')
	assert ($r.log1 -contains 'Testing 1 with 2')

	# Test 2
	# - incorrect result
	assert (($r.out2 -join ', ') -eq 'this is 1')

	# Test 3
	# - correct result
	# - redundant job is avoided
	assert (($r.out3 -join ', ') -eq 'this is 1, this is 2')
	assert ($r.log3 -notcontains 'Testing 1 with 2')
}
