
function Test($Input) {
	# one may expect $Input is 42 but it is not
	"Param=$Input"

	# it is an empty ArrayListEnumeratorSimple
	$Input.GetType().Name
}

Test 42
