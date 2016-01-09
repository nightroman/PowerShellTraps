
### Adapted properties may conflict with native

PowerShell provides an adapter for `XmlNode` and derived classes. As a result,
we can use the dot-notation in order to access `XmlElement` attributes and
child nodes as if they were properties. This is very handy. But adapted
properties may hide native .NET properties.

All native properties are potentially troublesome. The property `Name` is very
likely troublesome because this name is often used for element attributes.

Thus, the expression `$elem.Name` is ambiguous. It gets the element name if an
attribute "Name" or child elements "Name" are not present and gets their values
otherwise. Note that adapted properties are case insensitive, so that "name"
and "NAME" nodes also hide the element property `Name` with dot-notation.

A reliable way to get an element name is

    $elem.get_Name()

A reliable and case sensitive way to get an attribute "Name" value is

    $elem.GetAttribute('Name')

Scripts

- [Test-1.Element.ps1](Test-1.Element.ps1) - `.Name` gets element name
- [Test-2.Attribute.ps1](Test-2.Attribute.ps1) - `.Name` gets value of attribute `name`
- [Test-3.ChildNode.ps1](Test-3.ChildNode.ps1) - `.Name` gets value of child element `name`

***
### Adapted properties accept only string values

In many cases PowerShell converts values to required target types. PowerShell
refuses to convert not string values to strings on setting adapted properties
of `XmlNode`. This may be unexpected, some code may work for a while with
string values, and fail later when not strings are assigned.

The script [Test-4.Cannot.set.number.ps1](Test-4.Cannot.set.number.ps1) shows the issue.

***
### Adapted properties have different nature

An adapted property may represent

1. A single attribute value (`String`), read/write.
1. A single element text (`String`), read/write.
1. Several objects (`Object[]`), read only.

As a result, if XML structure is not known for sure then use of adapted node
properties may cause mistakes. Some unexpected values may be returned or set.

The script [Test-5.Cannot.set.string.ps1](Test-5.Cannot.set.string.ps1) shows the above cases.
