
The `PSCustomObject` was introduced in PowerShell v3 and is used to create
custom objects. While they pretend to be a normal object, they have their
own set of traps.

### No Count for single items

Starting with PowerShell v3, a surrogate property called count is added to
most objects. We cover this in another section but `PSCustomObject` is an
exception to this feature. Instead of a single object returning 1, these
objects return `$null` instead.

Keep this in mind when doing comparisons. The example below will evaluate
to `$false` when there is one object.

```powershell
$object = [PSCustomObject]@{Name='Test'}
if ($object.Count -gt 0) {
    # do something
}
```

See also [Number-of-returned-objects](../Number-of-returned-objects).

### ToString() is empty

Most objects will either convert their value to a string when you call
`ToString()` or they will return the type name. `PSCustomObject` returns
an empty string instead.

See the script [Test1.ToString.ps1](Test1.ToString.ps1) for an example.
