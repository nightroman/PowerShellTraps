
Logical operators applied to collections is a very useful feature when used
properly. But how it actually works is not always obvious. It may be a trap.

Logical operators do not return logical true or false for collections, as one
may expect. Instead, they return all collection items that gets true with an
operator applied to them. In other words, operators work more like filters
allied to a collection.

Scripts

- *looks-like-object-is-null.ps1* shows how `-eq $null` may look like true for a not null object.
- *object-is-eq-and-ne-to-1.ps1* shows how `-eq 1` and `-ne 1` may look like true for the same object.
- *.test.ps1* tests the above scripts.

---

- Stack Overflow [Match operator returns true but $matches is null](http://stackoverflow.com/q/8651905/323582)
