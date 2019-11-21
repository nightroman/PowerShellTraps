## Cannot derive a class from another defined later

In C#, the order of class definitions is not important.
Derived classes may be defined before their base classes.

In PowerShell, base classes must be defined before derived.

Scripts

- [Test-1.ps1](Test-1.ps1) - an error due to a derived class defined before the base
- [Test-2.ps1](Test-2.ps1) - the same scenario in C# is not an issue

Why do we need a derived class defined before the base?
For example, this is tempting in order to work around another issue:
[Attribute-with-later-defined-type-parameter](../Attribute-with-later-defined-type-parameter)
