
task continue-works-for-switch {
	($r = .\continue-works-for-switch.ps1)
	equals $r.Count 4
	equals $r[3] 'Process 4'
}

task switch-hides-current-item {
	($r = .\switch-hides-current-item.ps1)
	equals $r.Count 3
	equals $r[2] "Word '5' length is not 3."
}

task use-continue-not-break {
	($r = .\use-continue-not-break.ps1)

	# Test 1
	# - correct result
	# - redundant job is done
	equals ($r.out1 -join ', ') 'this is 1, this is 2'
	assert ($r.log1 -contains 'Testing 1 with 2')

	# Test 2
	# - incorrect result
	equals ($r.out2 -join ', ') 'this is 1'

	# Test 3
	# - correct result
	# - redundant job is avoided
	equals ($r.out3 -join ', ') 'this is 1, this is 2'
	assert ($r.log3 -notcontains 'Testing 1 with 2')
}
