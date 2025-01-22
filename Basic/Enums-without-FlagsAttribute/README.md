# Enums without `[Flags]` attribute

Enums without `[Flags]` attribute may be formally created from several enum
member names, ether joined with `,` or array of names. This may work or not,
depending on the used member names. The fact that this works sometimes may
lead to mistakes discovered later.

## Test 1, all may look "good"

See [Test-1-enum-works.ps1](Test-1-enum-works.ps1)

These expressions successfully create `[DayOfWeek]::Wednesday`:

```powershell
[DayOfWeek]'Monday,Tuesday'
[DayOfWeek]('Monday', 'Tuesday')
```

This result is consistent with `[Enum]::Parse([DayOfWeek], 'Monday,Tuesday')`.

## Test 2, failures and inconsistency

See [Test-2-enum-fails.ps1](Test-2-enum-fails.ps1)

But these expressions fail:

```powershell
[DayOfWeek]'Monday,Saturday'
[DayOfWeek]('Monday', 'Saturday')
```

with these errors:

```
Cannot convert value "Monday,Saturday" to type "System.DayOfWeek" due to enumeration values that are not valid.
Specify one of the following enumeration values and try again.
The possible enumeration values are "Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday".
```

This result is inconsistent with `[Enum]::Parse([DayOfWeek],
'Monday,Saturday')` which works and creates the value `7`.

***

- [PowerShellTraps/issues/21](https://github.com/nightroman/PowerShellTraps/issues/21)

[Enum.Parse]: https://learn.microsoft.com/en-us/dotnet/api/system.enum.parse
