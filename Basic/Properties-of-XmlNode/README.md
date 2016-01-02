
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
