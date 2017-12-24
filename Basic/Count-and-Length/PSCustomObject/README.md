
### PSCustomObject does not have surrogate Count and Length

See help *about_Properties*:

    Beginning in Windows PowerShell 3.0, Windows PowerShell tries
    to prevent scripting errors that result from the differing
    properties of scalar objects and collections.

    --  If you request the Count or Length property of zero objects
        or of one object, Windows PowerShell returns the correct value.

This is not the case for `PSCustomObject` objects.
They do not have surrogate `Count` and `Length`.

[Test-1.normal.vs.custom.ps1](Test-1.normal.vs.custom.ps1) shows that "normal"
objects have the surrogate `Count` and "custom" do not.

[Test-2.Select-Object.ps1](Test-2.Select-Object.ps1) reminds that custom objects
may appear even if you do not create them explicitly. For example, `Select-Object`
may return custom objects. So the result `Count` may depend on using or not using
`Select-Object` in a pipeline.

***

- [Number-of-returned-objects](../../Number-of-returned-objects)
- [PowerShell/issues/3671](https://github.com/PowerShell/PowerShell/issues/3671)
