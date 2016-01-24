
`ConvertFrom-Json` accepts pipeline input but its help does not explain all the
details. The straightforward scenario is

    Get-Content data.json | ConvertFrom-Json

so that input strings are lines of a JSON file. Here is what tests cases show.

If the first line is empty then null is returned for it. Then all lines are
joined and converted to an object. As a result, two objects are returned,
the first null and the second converted object.

If the first line is not empty then it is converted to an object. If this fails
then all lines are joined and converted into an object and a single object is
returned. If the first conversion succeeds then the result object is returned
and then each next line is converted into an object and returned with empty
lines converted to nulls.

In other words, consider to follow these rules:

- If a JSON file contains one object then avoid the first empty line, otherwise
  two objects are returned, the first is null. Alternatively, read the file as
  one string and then invoke `ConvertFrom-Json` with it.
- If a JSON file contains many objects then each object should be represented
  as one line. The first line must not be empty. Other empty lines should be
  avoided unless result nulls are expected by design.

Scripts

- These cases work fine
    - [Test-1.multiline.object.ps1](Test-1.multiline.object.ps1)
    - [Test-1.oneline.objects.ps1](Test-1.oneline.objects.ps1)
- These cases have issues
    - [Test-2.multiline.object.empty.ps1](Test-2.multiline.object.empty.ps1)
    - [Test-2.oneline.objects.empty.ps1](Test-2.oneline.objects.empty.ps1)
- These cases fail
    - [Test-3.multiline.objects.ps1](Test-3.multiline.objects.ps1)
    - [Test-3.oneline.objects.first.empty.ps1](Test-3.oneline.objects.first.empty.ps1)
