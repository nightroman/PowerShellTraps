
# This script fails due to a parser error: Unable to find type [_160205_162916].

#requires -version 5

# Custom type added by Add-Type
Add-Type @'
using System;
public class _160205_162916 {
	public static string Test() {
		return "_160205_162916";
	}
}
'@

# Class using the custom type explicitly
class A {
	[string] Test() {
		return [_160205_162916]::Test()
	}
}
