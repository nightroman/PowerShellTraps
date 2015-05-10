
# A function with two parameters.
function Test-Parameter($Param1, $Param2) {
	"Param1 = $Param1; Param2 = $Param2"
}

# Param1 is 1. Param2 is 2.
Test-Parameter 1 2

# Param1 is an array of two items (1, 2). Param2 is not specified.
Test-Parameter 1, 2

# Ditto.
Test-Parameter (1, 2)

# Ditto, but this is an error in the strict mode.
Test-Parameter(1, 2)
