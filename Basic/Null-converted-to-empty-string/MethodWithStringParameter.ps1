
# Add [TestMethodWithStringParameter]::Test() to be tested
Add-Type @'
using System;
public static class TestMethodWithStringParameter
{
	public static string Test(string value)
	{
		if (value == null)
			return "Processed as null";
		else
			return "Processed as '" + value + "'";
	}
}
'@
