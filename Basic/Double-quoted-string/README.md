# Double quoted strings and sub-expressions with double quotes

The help topic

    help about_Quoting_Rules

says

    Also, in a double-quoted string, expressions are evaluated, and the
    result is inserted in the string. For example:

        "The value of $(2+3) is 5."

    The output of this command is:

        The value of 5 is 5.

but it does not emphasize the following not obvious fact. In the expression
result, two consequent double quotes or a backtick followed by a double quote
are replaced with one double quote.

In other words, the following two strings

```
".. $('""') .."
".. $('`"') .."
```

are evaluated as

```
.. " ..
.. " ..
```

instead of rather expected

```
.. "" ..
.. `" ..
```

The script [Test-1.expression.ps1](Test-1.expression.ps1) shows the issue.

- [PowerShell/issues/3039](https://github.com/PowerShell/PowerShell/issues/3039)
