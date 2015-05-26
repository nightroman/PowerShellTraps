
$log = New-Object System.Collections.Specialized.OrderedDictionary

# original text
$string = '``text``'
$log.OriginalText = $string

# escape, gets unexpected ``text``, expected would be ````text````
$escaped = [Management.Automation.WildcardPattern]::Escape($string)
$log.EscapedText = $escaped

# match the original text ($false, expected $true)
$log.MatchesOriginal = $string -like $escaped

# unescape, gets `text` which is not equal to the original
$unescaped = [Management.Automation.WildcardPattern]::UnEscape($escaped)
$log.UnEscapedText = $unescaped
$log.EqualToOriginal = $unescaped -eq $string

# show log
$log
