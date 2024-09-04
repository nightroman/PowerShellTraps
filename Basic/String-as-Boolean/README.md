# String as Boolean

The rule: empty strings are treated as false, not empty strings are treated as true (including strings "False").

The rule works fine in Boolean expressions:

```powershell
if ($value) {...}
if (!$value) {...}
```

The rule works fine in cast expressions:

```powershell
[bool]$value
```

But assigning a string to a typed variable of type `[bool]` may work or fail depending on invocation:

```powershell
[bool]$var = $value
```

**Scripts**

- [Test-1.ps1](Test-1.ps1) shows how empty strings work as false
- [Test-2.ps1](Test-2.ps1) calls `Test-1.ps1` and shows how assigning to `[bool]` may work or fail
- [Test-3.ps1](Test-3.ps1) shows how not empty strings work as true
- [Test-4.ps1](Test-4.ps1) calls `Test-3.ps1` and shows how assigning to `[bool]` may work or fail
