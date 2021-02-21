# String equality operators

String equality operators (`-eq`, `-ceq`) do not compare strings "literally"
(i.e. using `StringComparison.OrdinalIgnoreCase`, `StringComparison.Ordinal`).
Presumably, they use `InvariantCultureIgnoreCase` and `InvariantCulture`.

Without care, depending on strings in use, results may be unexpected.
When in doubts, use `[String]::Equals` with the required `StringComparison`.

Scripts:

- [Test-1.ps1](Test-1.ps1) - shows that the binary zero is ignored by string operators.
- [Test-2.ps1](Test-2.ps1) - shows how two certain characters may be equal to one.
    - changes in 7.1.0-rc.2, v7.1.1, v7.2.0-preview.3

---

- [user voice](https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/13275057-bug-or-doing-comparison)
