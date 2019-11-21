## Attribute with later defined type parameter

Some attributes have type parameters in order to specify serializers, visualizers, proxies, etc.
In PowerShell, attributes with type parameters may have issues.
If the specified types are defined later then these values are nulls.
The problem is discovered on invocation, not parsing.

Workarounds?
Changing the order of class definitions may help.
This is not always possible, for example due to another issue:
[Cannot-derive-from-defined-later](../Cannot-derive-from-defined-later).

Scripts

- [Lib.cs](Lib.cs) - defines an attribute for tests and two classes with this attribute and no issues in C#
- [Lib.ps1](Lib.ps1) - defines `T1` with `KnownType([T2])` and then defines `T2`, this is the issue
- [Test-1.ps1](Test-1.ps1) - shows the issue in PowerShell and no issue in C#
