
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

# and save it as the script variable
$Type = [Type]'_160205_162916'

# Class uses the type specified by the script variable
class A {
	[string] Test() {
		return $script:Type::Test()
	}
}

# Test
[A]::new().Test()
