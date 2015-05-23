
When `Get-ChildItem -Recurse` is invoked in v3+ with a path that does not
exist, it searches for all files and directories with the specified name
instead.

As a result of this feature, one may get some unexpected items back, see
*test3.unexpected.something.ps1*. Or there may be serious performances issues,
see *test4.takes.ages.gets.nothing.ps1*, unexpected returned items are also
possible.

A workaround is to always test paths before getting items

```PowerShell
    if (Test-Path SomePath) {
        Get-ChildItem SomePath -Recurse
    }
```

The workaround is not bulletproof though. If another process removes `SomePath`
after the check is done and before `Get-ChildItem` is called then results may
be unexpected.

Scripts

- *test1.expected.error.ps1* shows that `Get-ChildItem` without `Recurse` fails, as expected.
- *test2.unexpected.nothing.ps1* shows that with `Recurse` it may silently get nothing.
- *test3.unexpected.something.ps1* shows that with `Recurse` it may get something unexpected.
- *test4.takes.ages.gets.nothing.ps1* shows a huge performance issue, it is not covered by *.test.ps1*.

---

- Microsoft Connect [766100](https://connect.microsoft.com/PowerShell/feedback/details/766100)
