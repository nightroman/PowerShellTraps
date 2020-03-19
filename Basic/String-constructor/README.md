## String constructor

If a class `X` has the string constructor `X(string)` then PowerShell may call
this constructor somewhat unexpectedly.

### New-Object traps

`New-Object X` or v5+ `[X]::new()` may create `X` from literally any input
object. PowerShell simply converts input objects to stings using their
`ToString()` methods.

This may be handy in interactive scenarios. But in scripts potential mistakes
may be more difficult to discover. If a not suitable input object is used and
the constructor does not fail, e.g. due to input validation, then `X` may be
created successfully with some unexpected data.

Script [Test-1.ps1](Test-1.ps1) shows the issue. `X` is successfully created
from a presumably wrong object.

### Casting traps

PowerShell casting constructs `[X] expression` may call constructors as well.

If `expression -is [X]` then PowerShell literally casts the expression type.

If `expression -isnot [X]` then PowerShell looks for a suitable constructor of
`X` depending on the expression type. The constructor `X(string)` may be called
unexpectedly when `expression` is not a string and arguably more suitable
constructors exist.

Script [Test-2.ps1](Test-2.ps1) shows the issue. `X` is created using the
unexpected constructor, more likely.

---

- [PowerShell's casting can result in some weird results](https://gist.github.com/Jaykul/bb6269ee483e1323fd77ef4c7c4cc290)
