
# The script shows that we can dot-source a command which defines a class and
# then use this class, i.e. instantiate and invoke members.

#requires -version 5

function Use-ClassA {
	class A {
		[string] Test() {
			return 'A'
		}
	}
}

. Use-ClassA

$r = [A]::new()
$r.Test()
