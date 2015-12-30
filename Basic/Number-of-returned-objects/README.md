
Some commands are supposed to return several objects and a caller may want to
know the number of returned objects. How to get this number?

For example, a command `Get-Something` is called like this:

```powershell
    $results = Get-Something
```

Do `$results.Count` or `$results.Length` get the number of returned objects?
They do sometimes. But the correct answer is no for various reasons depending
on a PowerShell version.

**PowerShell v2.0**

If a command returns nothing then `$results` is null. In this case `Count` and
`Length` get null which is converted to 0 where a number is expected. So this
may work unless the strict mode is enabled. In the strict mode `$null.X` is an
error.

If a command returns one object then `Count` and `Length` get either existing
property `Count` or `Length` value or null. In any case this value has nothing
to do with 1, the number of returned objects. Also, missing properties are
errors in the strict mode.

**PowerShell v3.0**

Properties `Count` and `Length`, either native or surrogate, now exist for any
object. The surrogate properties get 0 for null (the case of no results) and 1
for not null (the case of one result object).

Do `$results.Count` or `$results.Length` get the number of returned objects
now? The answer is still sometimes.

Firstly, the surrogate properties are errors in the strict mode, so that they
cannot be used safely. See [Count-and-Length-in-Strict-Mode](../Count-and-Length-in-Strict-Mode).

Secondly, if the only returned object has native `Count` or `Length` then the
native value has nothing to do with 1, the number of returned objects.

**The reliable way**

The operator `@()` provides the reliable way to deal with the problem. It wraps
a null with an empty array, a single object with an array with this object, and
multiple objects with an array of them. Thus, the result of this command is not
ambiguous

```powershell
    $results = @(Get-Something)
```

The `$results` is an array and its `Count` and `Length` get the number of
returned objects.

Scripts

- [test1.no.results.ps1](test1.no.results.ps1) uses `$results.Count` on no results.
- [test1.no.results.strict.ps1](test1.no.results.strict.ps1) - ditto in the strict mode.
- [test2.one.object.Count.ps1](test2.one.object.Count.ps1) uses `$results.Count` on a single object (lucky in v3).
- [test2.one.object.Count.strict.ps1](test2.one.object.Count.strict.ps1) - ditto in the strict mode.
- [test3.one.object.Length.ps1](test3.one.object.Length.ps1) - same as lucky 2 but uses `$results.Length` (unlucky).
- [test4.one.object.Count.ps1](test4.one.object.Count.ps1) - same as lucky 2 but the object is different (unlucky).
