
[Missing-ternary-operator]: ../Missing-ternary-operator

PowerShell statements like `if`, `for`, `switch`, and etc. are not expressions
and they cannot be used as expressions except one special case. PowerShell 2.0
allowed to use them on assignment to a variable or a property.

For example, here is an alternative to the missing ternary operator (not ideal,
see [Missing-ternary-operator]):

```powershell
    $result = if ($condition) {$data1} else {$data2}
```

Ability to assign statement results is useful. But it also may cause an
illusion that statements can be used as expressions in other cases, too.

For example, this works:

```powershell
    $result = foreach($e in 1..5) {$e}
    $result | %{"Result is $_"}
```

As far as the above works, it may look natural to eliminate the intermediate
variable `$result` and just pipe (convert, redirect, etc.) results directly.
But these commands are not correct:

```powershell
    # syntax error "An empty pipe element is not allowed."
    foreach($e in 1..5) {$e} | %{"Result is $_"}

    # syntax error "Unexpected token 'in' in expression or statement."
    [string](foreach($e in 1..5) {$e})

    # error "The term '>' is not recognized as the name of a cmdlet..."
    foreach($e in 1..5) {$e} > z.log
```

Note that the last command is not even a syntax error, it is the runtime error.
The command works, it outputs numbers from 1 to 5 and then fails, see the test.

### Workaround

The subexpression operator `$()` converts statements to an expression:

```powershell
    $(foreach($e in 1..5) {$e}) | %{"Result is $_"}

    [string]$(foreach($e in 1..5) {$e})

    $(foreach($e in 1..5) {$e}) > z.log
```

The array operator `@()` also converts statements to an expression and
guaranties that the result is an array:

```powershell
    @(foreach($e in 1..5) {$e}).Count
```

Yet another way is to wrap statements with a script block and invoke it with
operators `.` (in the current scope) or `&` (in the script block scope):

```powershell
    .{foreach($e in 1..5) {$e}} | %{"Result is $_"}

    &{foreach($e in 1..5) {$e}} | %{"Result is $_"}
```

#### Scripts

- *foreach-cannot-be-piped.ps1* shows that output of `foreach` cannot be sent to a pipeline.
- *foreach-cannot-be-redirected.ps1* shows that output of `foreach` cannot be redirected.

---

- Microsoft Connect [680120](https://connect.microsoft.com/PowerShell/feedback/details/680120)
- [PowerShellTraps/issues/6](https://github.com/nightroman/PowerShellTraps/issues/6)
