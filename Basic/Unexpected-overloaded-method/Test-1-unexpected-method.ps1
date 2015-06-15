
# A class with two methods `Method`
Add-Type @'
using System;
public static class TestOverloadedMethod {
	public static string Method(object o, DateTime d) {
		return "Method(object, DateTime)";
	}
	public static string Method(bool b, string s) {
		return "Method(bool, string)";
	}
	public static string Test() {
		return Method(false, DateTime.Now);
	}
}
'@

# C# calls the first method
[TestOverloadedMethod]::Test()

# PowerShell calls the second method
[TestOverloadedMethod]::Method($false, [DateTime]::Now)

# Workaround (v3+): convert the first argument to [object]
[TestOverloadedMethod]::Method([object]$false, [DateTime]::Now)
