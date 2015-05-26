
$log = New-Object System.Collections.Specialized.OrderedDictionary

# original text with various combinations of special characters
$string = '``_`[_`]_`?_`*_[_]_?_*_`'

# original text
$log.OriginalText = $string

# escape the string using the workaround
$escaped = $string -replace '([`*?[\]])', '`$1'

# escaped text
$log.EscapedText = $escaped

# match the original string ($true, as expected)
$log.MatchesOriginal = $string -like $escaped

# unescape
$unescaped = [Management.Automation.WildcardPattern]::UnEscape($escaped)

# gets text which is equal to the original
$log.UnEscapedText = $unescaped
$log.EqualToOriginal = $unescaped -eq $string

# show log
$log
