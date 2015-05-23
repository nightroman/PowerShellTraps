
`[System.Enum]` values are always evaluated to true in logical expressions,
even though their numerical value is 0, and 0 is evaluated to false in
PowerShell. This may be a trap.

The script *object-looks-like-0-and-true.ps1* shows an object equal to 0 and
yet evaluated to true.
