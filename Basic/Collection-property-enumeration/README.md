
PowerShell 3.0 introduced collection property enumeration as one of language
enhancements. That is, if `$x` is a collection then `$x.Data1` gets values of
the property `Data1` from all collection items.

This feature saves time in some cases. Obviously, `$x.Data1` is the shortest of
these similar expressions:

```powershell
    $x.Data1
    $x | .{process{$_.Data1}}
    foreach($e in $x) {$e.Data1}
    $x | ForEach-Object {$_.Data1}
    $x | Select-Object -ExpandProperty Data1
```

But this new feature has some cost. It became more difficult to troubleshoot
cases when `$x` is supposed to be a scalar by design but it is unexpectedly a
collection during invocation, for example due to [unexpected extra output] or
other mistakes.

Unlike in PowerShell 2.0, in such cases `$x.Data1` is not null in the normal
mode and it is not always an error in the strict mode. Thus, the unexpected
collection and data may not reveal themselves at this point. Ironically,
`$x.Data1` is an unexpected collection itself, so that even expressions like
`$x.Data1.Data2` may not reveal that something is wrong at this point because
`.Data2` is applied to the unexpected collection just fine.

The script [Test-1-1-original-case-normal.ps1](Test-1-1-original-case-normal.ps1) is the simplified original
reported script. It contains a mistake. With this mistake the code works
without errors incorrectly and differently in v2 and v3+. In v2 it is less
likely going to cause any harm before the mistake is found and fixed. Of course
there may be cases when v2 is less safe but in general v3+ looks less safe.

The script [Test-1-2-original-case-strict.ps1](Test-1-2-original-case-strict.ps1) is the same but it is invoked in
the strict mode. Now the mistake is revealed immediately in v2. In v3 the code
still works incorrectly with no errors.

#### Workaround?

A proper workaround is unlikely possible, such mistakes are inevitable and in
v3+ `$x.Data1` is a valid expression even if `$x` is a collection by mistake.

But some sort of remedy exists. In some cases it looks safer to make checks
like `$value -eq $x.Data1` instead of more traditional `$x.Data1 -eq $value`.
See [logical operators with collections] for the details. Reversed checks get
false if `$x` and `$x.Data1` are unexpected collections.

The script [Test-1-3-safer-approach.ps1](Test-1-3-safer-approach.ps1) shows that in v3+ the reversed check
does not cause potentially unwanted processing of each item due to the mistake.

But the script [Test-2-1-noise-data-normal.ps1](Test-2-1-noise-data-normal.ps1) shows that even reversed checks
may not reveal some unexpected noise data.

The script [Test-2-2-noise-data-strict.ps1](Test-2-2-noise-data-strict.ps1) shows that the strict mode may help
in v3+, too, it reveals unexpected data which do not have expected properties.

---

- [PowerShellTraps/issues/4](https://github.com/nightroman/PowerShellTraps/issues/4)

[unexpected extra output]: ../Unexpected-output
[logical operators with collections]: ../Logical-operators-with-collections
