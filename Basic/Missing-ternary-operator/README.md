# Missing ternary operator

[Statements-are-not-expressions]: ../Statements-are-not-expressions
[Unrolled-collections]: ../Unrolled-collections

PowerShell v7.preview.4 introduced the ternary operator.
Older versions do not have it but workarounds exist.

### Workaround 1: if/else statement

The well known workaround is

```powershell
$result = if ($condition) {$data1} else {$data2}
```

It will do in most cases. But there are some drawbacks.

`if/else` may lose the original data type, see the tests and [Unrolled-collections].

`if/else` is a statement, not an expression, see [Statements-are-not-expressions].
Although it can be assigned to a variable, it cannot be used directly as a part
of another expression. In this case the subexpression `$(if ...)` must be used.

### Workaround 2: array/index expression

Yet another possible workaround is

```powershell
$result = ($data1, $data2)[!$condition]
```

It is not pretty perhaps but it preserves the original data type and it is an
expression, so that it can be used as a part of another expression directly.

#### Scripts

- [Test-1-ternary-workaround.ps1](Test-1-ternary-workaround.ps1) shows how 1 converts `Object[]` to `Int32`, 2 preserves the data.
- [Test-2-ternary-workaround.ps1](Test-2-ternary-workaround.ps1) shows how 1 converts `ArrayList` to `Object[]`, 2 preserves the data.
- [Test-3-part-of-expression.ps1](Test-3-part-of-expression.ps1) shows how 1 and 2 are used in another expression, 1 with `$()`, 2 as it is.
- [Test-4-v7.ps1](Test-4-v7.ps1) uses the ternary operator in v7.

---

- Microsoft Connect 53059
