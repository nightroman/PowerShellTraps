
### Counter-intuitive equal precedence of some operators

Equal precedence of some operators may be counter-intuitive.

    help about_Operator_Precedence

        The following group of operators have equal precedence. Their
        case-sensitive and explicitly case-insensitive variants have
        the same precedence.

        -split (binary)                  about_Split
        -join (binary)                   about_Join
        -is  -isnot  -as                 about_Type_Operators
        -eq  -ne  -gt  -gt  -lt  -le     about_Comparison_Operators
        -like  -notlike                  about_comparison_operators
        -match  -notmatch                about_comparison_operators
        -in -notIn                       about_comparison_operators
        -contains -notContains           about_comparison_operators
        -replace                         about_comparison_operators

It looks reasonable that various comparison-like operators which get Boolean
results have equal precedence. But other operators `-as`, `-split`, `-join`,
and `-replace` are rather different by nature and their equal precedence with
comparison operators may be unexpected. As far as they are not specifically
designed to operate on Boolean, one may expect them to have higher precedence.

For example, `-join` and `-replace` produce strings and it may look natural
that they are evaluated first and then string comparison operators are applied
to result strings. Otherwise it would not make much sense to `-join` a Boolean
value or `-replace` something in it.

Besides, `-join` is somewhat similar to the operator `+` applied to strings.
`+` has higher precedence than `-eq`, so one may expect the same for `-join`.

The following scripts are contrived but the mistake they describe was real. It
was not easy to discover because an incorrect expression worked as correct for
a while.

- [Test-1.Confusion.ps1](Test-1.Confusion.ps1)
- [Test-2.Explanation.ps1](Test-2.Explanation.ps1)
- [Test-3.OperatorPlus.ps1](Test-3.OperatorPlus.ps1)

***

- [And-and-or-have-same-precedence](../And-and-or-have-same-precedence)
