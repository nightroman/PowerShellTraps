# Operators `-match`, `-notmatch` do not reset `$matches`

    help about_comparison_operators

        -Match
          Description: Matches a string using regular expressions.
                       When the input is scalar, it populates the
                       $Matches automatic variable.

    help about_Automatic_Variables

        $Matches
           The $Matches variable works with the -match and -notmatch operators.
           When you submit scalar input to the -match or -notmatch operator, and
           either one detects a match, they return a Boolean value and populate
           the $Matches automatic variable with a hash table of any string values
           that were matched. For more information about the -match operator, see
           about_comparison_operators.


Help does not explicitly tell what happens to `$matches` when `-match` or
`-notmatch` does not detect a match. One may expect that it is reset to empty.
But it looks like it is left not changed. In other words, it is populated with
some previous results, if any.

Scripts

- [Test-1.match.ps1](Test-1.match.ps1) shows the issue with `-match`
- [Test-2.notmatch.ps1](Test-2.notmatch.ps1) shows the issue with `-notmatch`
- [Test-3.regex.ps1](Test-3.regex.ps1) shows how `[regex]` works in this scenario

***

- Microsoft Connect 1601710
