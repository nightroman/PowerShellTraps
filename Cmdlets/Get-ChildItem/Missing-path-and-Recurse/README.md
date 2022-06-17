# `Get-ChildItem -Recurse` and missing `-Path` unexpected search

When `Get-ChildItem -Recurse` is invoked in v3+ with a path that does not
exist, it searches for all files and directories with the specified name
instead.

As a result of this feature, one may get some unexpected items back, see
[test3.unexpected.something.ps1](test3.unexpected.something.ps1). Or there may be serious performances issues,
see [test4.takes.ages.gets.nothing.ps1](test4.takes.ages.gets.nothing.ps1), unexpected returned items are also
possible.

Workarounds

- Use the parameter `LiteralPath`.
- Test paths before using with the parameter `Path`.

Scripts

- [test1.expected.error.ps1](test1.expected.error.ps1) shows that `Get-ChildItem` without `Recurse` fails, as expected.
- [test2.unexpected.nothing.ps1](test2.unexpected.nothing.ps1) shows that with `Recurse` it may silently get nothing.
- [test3.unexpected.something.ps1](test3.unexpected.something.ps1) shows that with `Recurse` it may get something unexpected.
- [test4.takes.ages.gets.nothing.ps1](test4.takes.ages.gets.nothing.ps1) shows a huge performance issue, it is not covered by [.test.ps1](.test.ps1).

---

- [PowerShell/issues/5699](https://github.com/PowerShell/PowerShell/issues/5699)
- Microsoft Connect 766100
