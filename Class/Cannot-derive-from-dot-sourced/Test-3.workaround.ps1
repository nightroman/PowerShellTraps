# The work around the parser error in the previous script is Invoke-Expression
# with the source code of derived class.

#requires -version 5

function Use-ClassA {
	class A {
		[string] Test() {
			return 'A'
		}
	}
}

# dot-source class A
. Use-ClassA

# derive class B
Invoke-Expression @'
	class B : A {
		[string] TestB() {
			return 'B'
		}
	}
'@

# test class B
$b = [B]::new()
$b.Test()
$b.TestB()
