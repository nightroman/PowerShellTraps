
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

It is fine that several boolean operators in this group have equal precedence.
But other operators `-split`, `-join`, and `-replace` are not boolean and,
moreover, they are designed to operate on strings, not boolean.

So one may incorrectly assume that `-split`, `-join` and `-replace` have higher
precedence than boolean operators because it is not useful to apply them after
boolean. Especially `-join` and `-replace`, they produce strings and it may
look natural that boolean operators are applied to result strings after.

The following scripts are contrived but the mistake they describe was real. It
was not easy to discover because an incorrect expression worked as correct for
a while.

- [*Test-1.Confusion.ps1*](Test-1.Confusion.ps1)
- [*Test-2.Explanation.ps1*](Test-2.Explanation.ps1)

----

- [And-and-or-have-same-precedence](../And-and-or-have-same-precedence)
