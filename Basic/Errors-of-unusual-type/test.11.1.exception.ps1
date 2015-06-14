
$ErrorActionPreference = 'Continue'

Add-Type @'
public static class TestException1 {
	public static void Test() {
		throw new System.Exception("Oops");
	}
}
'@

[TestException1]::Test()

'Continued after error'
