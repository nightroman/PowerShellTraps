
In PowerShell v2 it is possible to operate on properties `Count` and `Length`
assuming they get null if missed and null is converted to 0 where a number is
expected. The below example calculates the total size of the current directory:

```PowerShell
$totalLength = 0
Get-ChildItem -Force -Recurse | %{
    $totalLength += $_.Length
}
```

`Length` gets the file length for file items and gets 0 (converted null) for
directory items because directory items do not have the property `Length`.

In PowerShell v3 any object has properties `Count` and `Length`. For nulls they
get 0. For objects with native `Count` or `Length` their values are returned.
For other objects they get 1, not null.

As a result, in the above code 1 is added to the sum for each directory item.

This feature makes it more difficult to work with heterogeneous collections
where some objects have their native `Count` or `Length` and some do not.
It is not possible to assume that 0 and missing is logically the same.

Scripts

- *Test-DirectorySize.ps1* calculates a directory size using two methods.
- *.test.ps1* tests different results in different versions.

---
- Microsoft Connect [793560](https://connect.microsoft.com/PowerShell/feedback/details/793560)
