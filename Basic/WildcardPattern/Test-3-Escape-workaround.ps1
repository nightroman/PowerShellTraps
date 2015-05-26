
$log = New-Object System.Collections.Specialized.OrderedDictionary

# original text with various combinations of special characters
$string = '``_`[_`]_`?_`*_[_]_?_*_`'
$log.OriginalText = $string

# escape the text using the workaround with regex
$escaped = $string -replace '([`*?[\]])', '`$1'
$log.EscapedText = $escaped

# match the original text ($true, as expected)
$log.MatchesOriginal = $string -like $escaped

# unescape, gets the text which is equal to the original
$unescaped = [Management.Automation.WildcardPattern]::UnEscape($escaped)
$log.UnEscapedText = $unescaped
$log.EqualToOriginal = $unescaped -eq $string

# show log
$log
