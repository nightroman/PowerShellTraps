
Add-Type @'
public class TestAndOrPrecedence {
	public static bool Test() {
		return true || true && false;
	}
}
'@

[TestAndOrPrecedence]::Test()
