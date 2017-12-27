
The type `PSCustomObject` is used to create custom objects. In many cases custom
objects behave as normal .NET objects, i.e. they have properties and methods.
But they still have some differences.

### No surrogate properties Count and Length

Starting with PowerShell v3, a surrogate property called count is added to
most objects. We cover this in another section but `PSCustomObject` is an
exception to this feature. Instead of a single object returning 1, these
objects return `$null` instead.

See

- [Count-and-Length/PSCustomObject](../Count-and-Length/PSCustomObject)
- [Number-of-returned-objects](../Number-of-returned-objects).

### ToString() is empty

Most objects will either convert their value to a string when you call
`ToString()` or they will return the type name. `PSCustomObject` returns
an empty string instead.

See the script [Test-1.ToString.ps1](Test-1.ToString.ps1) for an example.

### Notation `[PSCustomObject]@{...}` and v2

The notation `[PSCustomObject]@{...}` was introduced in v3 in order to make
creation of custom objects easier using hashtables.

In v2, this syntax is not an error but the result is different from v3+.
Namely, in v3+ it is `PSCustomObject` with custom properties, in v2 it is
`Hashtable` with keys and values. This may be fine in some cases because
hashtables behave like property bags in PowerShell, too. In other cases,
the difference may cause issues.
