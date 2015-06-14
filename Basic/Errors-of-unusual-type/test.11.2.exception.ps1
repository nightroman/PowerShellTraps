
$ErrorActionPreference = 'Continue'

Add-Type @'
public static class TestException2 {
	public static void Test() {
		throw new System.Exception("Oops");
	}
}
'@

try {

	[TestException2]::Test()
	'Continued'
}
catch {
	"Caught $($_.FullyQualifiedErrorId)"
}
