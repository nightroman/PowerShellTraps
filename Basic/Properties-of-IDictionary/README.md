# Tricky properties of types implementing IDictionary

PowerShell dot-notation for dictionaries allows retrieval and assignment of
key/value pairs as if keys were properties. It is handy but it introduces a
problem for classes that implement `IDictionary` and have extra properties.

For example, the property `ConnectionString` of `DbConnectionStringBuilder`.
Assigning it as

```powershell
    $builder.ConnectionString = '...'
```

does not actually invokes the property setter but adds the key/value pair to
the dictionary and bypasses the connection string parsing which is done by the
setter.

A workaround:

```powershell
    $builder.set_ConnectionString('...')
```

Scripts

- [Test-1.incorrect.assignment.ps1](Test-1.incorrect.assignment.ps1) shows incorrect assignment of a property.
- [Test-2.correct.assignment.ps1](Test-2.correct.assignment.ps1) shows correct assignment of a property.

---

- [Dictionary-Count-Keys-Values](../Dictionary-Count-Keys-Values)
- Stack Overflow [question](http://stackoverflow.com/q/6237708/323582)
- Microsoft Connect 674159
