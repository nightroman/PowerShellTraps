
Some PowerShell expressions produce output which can be assigned to a variable
but cannot be sent to a pipeline or redirected.

For example, this works:

```PowerShell
    $result = foreach($e in 1..5) {$e}
    $result | %{"Result is $_"}
```

But this fails due to a syntax error:

```PowerShell
    foreach($e in 1..5) {$e} | %{"Result is $_"}
```

And this fails due to a missing command `>`:

```PowerShell
    foreach($e in 1..5) {$e} > z.log
```

Possible workarounds:

```PowerShell
    # using $(...)
    $(foreach($e in 1..5) {$e}) | %{"Result is $_"}

    # using @(...)
    @(foreach($e in 1..5) {$e}) | %{"Result is $_"}

    # using .{...}
    .{foreach($e in 1..5) {$e}} | %{"Result is $_"}
```

Scripts

- *foreach-cannot-be-piped.ps1* shows that output of `foreach` cannot be sent to a pipeline.
- *foreach-cannot-be-redirected.ps1* shows that output of `foreach` cannot be redirected.
