# Comparison operators work differently with scalars and collections

See

    help about_Comparison_Operators

       When the input to an operator is a scalar value, comparison operators
       return a Boolean value. When the input is a collection of values, the
       comparison operators return any matching values. If there are no matches
       in a collection, comparison operators do not return anything.

       The exceptions are the containment operators (-Contains, -NotContains),
       the In operators (-In, -NotIn), and the type operators (-Is, -IsNot),
       which always return a Boolean value.

Comparison operators applied to collections is a very useful feature when used
properly. But how this actually works is not always obvious. It may be a trap.

For example, the comparison like this

```powershell
    $object -eq $value
```

is not a safe way to test that `$object` is equal to `$value` if an object may
be a collection as well. See the tests.

Scripts

- [looks-like-object-is-null.ps1](looks-like-object-is-null.ps1) shows how `-eq $null` may look like true for a not null object.
- [object-is-eq-and-ne-to-1.ps1](object-is-eq-and-ne-to-1.ps1) shows how `-eq 1` and `-ne 1` may look like true for the same object.

---

- Stack Overflow [Match operator returns true but $matches is null](http://stackoverflow.com/q/8651905/323582)
