
function Test-Trap {
	# terminating error
	throw 13

	# after the error
	'This is invoked due to continue in trap.'

	# trap in the same scope
	trap {
		"Caught $_"
		continue
	}
}

Test-Trap
'After Test-Trap'
