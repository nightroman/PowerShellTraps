
# This script fails on the second [A]::new() : Unable to find type [A].

#requires -version 5

$Test1 = {
	class A {
	}
	[A]::new()
}

$Test2 = {
	class A {
	}
	[A]::new()
}

& $Test1
& $Test2
