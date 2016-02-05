
#requires -version 5

# Add the custom type
Add-Type @'
using System;
public class _160205_162916 {
	public static string Test() {
		return "_160205_162916";
	}
}
'@

# Use ([Type]'_160205_162916') instead of [_160205_162916]
class A {
	[string] Test() {
		return ([Type]'_160205_162916')::Test()
	}
}

# Test
[A]::new().Test()
