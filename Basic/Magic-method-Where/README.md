# Magic method `Where`

The magic method `Where` is similar to the cmdlet `Where-Object` but not
exactly the same. The differences may lead to subtle mistakes, e.g.
on carelessly changing some code from using one to another.

The magic method `Where` returns a collection of zero, one, or more items.
The result type is always ``[System.Collections.ObjectModel.Collection`1[PSObject]]``.

In same cases, i.e. with same input and script blocks, the cmdlet `Where-Object`
returns either nothing (kind of null) or one item (the type depends on it)
or an array of items. The result type is none, some, or `System.Object[]`.

**Scripts**

- [Test-1.magic-Where.ps1](Test-1.magic-Where.ps1)
- [Test-2.Where-Object.ps1](Test-2.Where-Object.ps1)

---

- [ForEach and Where magic methods](https://powershellmagazine.com/2014/10/22/foreach-and-where-magic-methods/)
