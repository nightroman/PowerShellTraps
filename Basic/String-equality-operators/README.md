# String equality operators

String equality operators (`-eq`, `-ceq`) do not compare strings "literally",
i.e. using `StringComparison.OrdinalIgnoreCase`, `StringComparison.Ordinal`.
Presumably, they use `CurrentCultureIgnoreCase` and `CurrentCulture` because in
some versions results depend on the current `$PSCulture`, `$PSUICulture`.

Without care, depending on strings in use, the results may be unexpected.
When in doubts, use `[String]::Equals` with the required `StringComparison`.

Scripts:

- [Test-1.ps1](Test-1.ps1) shows that a binary zero is ignored by string operators.
- [Test-2.ps1](Test-2.ps1) shows how two certain characters may be equal to one.
