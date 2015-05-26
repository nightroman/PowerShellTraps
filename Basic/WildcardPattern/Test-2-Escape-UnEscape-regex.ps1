
$log = New-Object System.Collections.Specialized.OrderedDictionary

# original text
$string = '\\text\\'
$log.OriginalText = $string

# escape the text, gets expected \\\\text\\\\
$escaped = [regex]::Escape($string)
$log.EscapedText = $escaped

# match the original text ($true, as expected)
$log.MatchesOriginal = $string -match $escaped

# unescape, gets \\text\\ which is equal to the original
$unescaped = [regex]::UnEscape($escaped)
$log.UnEscapedText = $unescaped
$log.EqualToOriginal = $unescaped -eq $string

# show log
$log
