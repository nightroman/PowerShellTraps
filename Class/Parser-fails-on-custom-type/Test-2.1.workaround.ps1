
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

# Dot-source a class from another script,
# the class may reference the custom type
. $PSScriptRoot\Class.ps1

# Test
[A]::new().Test()
