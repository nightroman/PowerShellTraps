
[Invoke-Build]: https://github.com/nightroman/Invoke-Build

Most of demo scripts come together with related tests in `*.test.ps1` files. Test tasks are invoked by [Invoke-Build].

Invoke all `*.test.ps1` files in the current directory recursively:

```powershell
    Invoke-Build ** -Safe -Summary
```

Invoke the task `SomeTest` in `Some.test.ps1`:

```powershell
    Invoke-Build SomeTest Some.test.ps1
```

Invoke all tests in `Some.test.ps1`:

```powershell
    Invoke-Build * Some.test.ps1
```
