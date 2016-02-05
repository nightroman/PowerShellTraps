
# This script works because script blocks are not exactly the same

#requires -version 5

$Test1 = {
	class A {
	}
	[A]::new()
}

$Test2 = {
	# any difference in the code, even a comment
	class A {
	}
	[A]::new()
}

& $Test1
& $Test2
