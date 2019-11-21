#requires -version 5

# In C#, it is not a problem to derive a class from another defined later.
Add-Type @'
public class DerivedFromDefinedLater : DefinedLater
{
	public object P2;
}

public class DefinedLater
{
	public object P1;
}
'@

$r = [DerivedFromDefinedLater]::new()
$r.GetType().Name
