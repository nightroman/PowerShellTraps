
### Copy-Item: the parameter Exclude does not work

When `Copy-Item` is used with `Exclude` and `Recurse` then `Exclude` is ignored
and items supposed to be skipped are copied, too.

The script *Test-Copy-Item-Exclude.ps1* shows the problem. It is supposed to
copy `test.txt` and skip `test.log`. But both files are copied, as a result.

---

- Microsoft Connect [1234983](https://connect.microsoft.com/PowerShell/Feedback/Details/1234983)
- Microsoft Connect [698513](https://connect.microsoft.com/PowerShell/feedback/details/698513)
- Stack Overflow [question and workarounds](http://stackoverflow.com/q/731752/323582)
