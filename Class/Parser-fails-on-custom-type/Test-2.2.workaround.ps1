
#requires -version 5

# Class adds a type itself and avoids explicit type literals
class A {
	hidden $Type

	A() {
		# Add the custom type
		Add-Type @'
using System;
public class _160205_162916 {
	public static string Test() {
		return "_160205_162916";
	}
}
'@
		# and save its type as the property
		$this.Type = [Type]'_160205_162916'
	}

	[string] Test() {
		# use the type saved as the property
		return $this.Type::Test()
	}
}

# Test
[A]::new().Test()
