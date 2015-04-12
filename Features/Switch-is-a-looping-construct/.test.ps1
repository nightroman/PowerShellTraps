
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
