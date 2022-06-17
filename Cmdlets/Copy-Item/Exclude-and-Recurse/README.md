# `Copy-Item` - `Exclude` is ignored with `Recurse`

**Fixed in v5.1**

When `Copy-Item` is used with `Exclude` and `Recurse` then `Exclude` is ignored
and items supposed to be skipped are copied, too.

The script [Test-Copy-Item-Exclude.ps1](Test-Copy-Item-Exclude.ps1) shows the problem. It is supposed to
copy `test.txt` and skip `test.log`. But both files are copied, as a result.

---

- Stack Overflow [question and workarounds](http://stackoverflow.com/q/731752/323582)
- Microsoft Connect 698513
- Microsoft Connect 1234983
