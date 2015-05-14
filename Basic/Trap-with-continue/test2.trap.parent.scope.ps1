
function Test-Trap {
	# terminating error
	throw 13

	# after the error
	'This is not invoked even with continue in trap.'
}

Test-Trap
'After Test-Trap'

# trap in the parent scope
trap {
	"Caught $_"
	continue
}
