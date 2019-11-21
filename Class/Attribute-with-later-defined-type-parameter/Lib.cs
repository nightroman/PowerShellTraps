// Classes:
// KnownTypeAttribute - the attribute used for tests in C# and PowerShell
// MyT1 - the class with the attribute [KnownType(typeof(MyT2))]
// MyT2 - the class which type is referenced above -- not an issue in C#

using System;

public class KnownTypeAttribute : Attribute
{
	private Type _knownType;
	public Type KnownType { get { return _knownType; } }

	public KnownTypeAttribute(Type knownType)
	{
		_knownType = knownType;
	}
}

[KnownType(typeof(MyT2))]
public class MyT1
{
	public object P1;
}

public class MyT2 : MyT1
{
	public object P2;
}
