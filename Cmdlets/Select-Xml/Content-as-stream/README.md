# `Select-Xml -Content` does not support input as stream

`Select-Xml` supports several kinds of input: file paths, XML nodes, strings.
Strings are specified by the parameter `Content`:

    help Select-Xml -Full

    SYNTAX
        ...
        Select-Xml [-XPath] <String> [-Namespace [<Hashtable>]] -Content <String[]>

    PARAMETERS
        -Content <String[]>
            Specifies a string that contains the XML to search. You can also pipe strings to Select-Xml.

            Accept pipeline input?       true (ByValue)

The parameter `Content` accepts an array of strings or strings may be piped.
The help does not tell that each input string should be a well-formed XML.

For example this command which pipes XML content by lines does not work well:

    pandoc.exe README.md --standalone | Select-Xml //x:a -Namespace @{x="http://www.w3.org/1999/xhtml"}

`Out-String` converts input lines to a single string and solves the issue:

    pandoc.exe README.md --standalone | Out-String | Select-Xml //x:a -Namespace @{x="http://www.w3.org/1999/xhtml"}

In PowerShell v2 `Select-Xml -Content` works differently, it ignores not-well
formed XML strings. In newer versions it writes non-terminating errors.

Scripts

- [Test-1.as.stream.ps1](Test-1.as.stream.ps1) shows issues on using lines as input
- [Test-2.as.string.ps1](Test-2.as.string.ps1) shows a workaround with `Out-String`
