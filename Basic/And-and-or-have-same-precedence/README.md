
Logical operators `-and` and `-or` have the same precedence, unlike in other
programming languages where logical *AND* has higher precedence.

This C# expression is evaluated to true

    true || true && false

This similar PowerShell expression is evaluated to false

    $true -or $true -and $false

To avoid this trap, especially on translating code from other languages to PowerShell, use parenthesis

    $true -or ($true -and $false)

---

- Microsoft Connect [285170](https://connect.microsoft.com/PowerShell/Feedback/Details/285170)
