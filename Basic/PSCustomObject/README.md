The `PSCustomObject` was introduced in PowerShell v3 and is used to create 
custom objects. While they pretend to be a normal object, they have their 
own set of traps.

**no count for single items**

Starting with PowerShell v3, a surrogate properties called count is added 
to most objects. We cover this in another section but `PSObject` and 
`PSCustomObject` are an exception to this feature. Instead of a single object
returning 1, these objects return `$null` instead.

Keep this in mind when doing comparisons. The example below will evaluate
to `$false` when there is one object and true if there were 2 objects.


```powershell
    $object = [pscustomobject]@{Name='Test'}
    If($object.count -gt 0)
    {
        # do something
    }
```

**ToString() is empty**
Most objects will either convert their value to a string when you call 
`.ToString()` or they will return the type name. `PSCustomObject` returns 
an empty string instead. If you use `[string]::isNullOrEmpty()` for on 
objects, then you need to be aware of this. This next example will also
give one result if there is one object and a different one if there are 
two objects.

```powershell
    $object = [pscustomobject]@{Name='Test'}
    If( -Not [string]::isNullOrEmpty($object) )
    {
        # do something
    }
```

The proper way to test a `PSCustomObject` for `$null` or an empty value is
to compare it to `$null`

```powershell
    If( $null -ne $object)
    {
        # do something
    }

```