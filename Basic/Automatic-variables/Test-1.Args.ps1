
function Test($Args) {
	# one may expect $Args is 42 but it is not
	"Param=$Args"

	# it is an empty Object[]
	$Args.GetType().Name
}

Test 42
