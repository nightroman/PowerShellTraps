
# The script shows that we cannot dot-source a command which defines a class
# and then use this class a base class. Parser error: Unable to find type [A].

#requires -version 5

function Use-ClassA {
	class A {
		[string] Test() {
			return 'A'
		}
	}
}

. Use-ClassA

class B : A {
}
