
$log = New-Object System.Collections.Specialized.OrderedDictionary

# 2 backslashes
$string = '\\text\\'

# original text
$log.OriginalText = $string

# escape the string with double backslashes
$escaped = [regex]::Escape($string)

# gets \\\\text\\\\ (correct)
$log.EscapedText = $escaped

# match the original string ($true, as expected)
$log.MatchesOriginal = $string -match $escaped

# unescape
$unescaped = [regex]::UnEscape($escaped)

# gets \\text\\ which is equal to the original
$log.UnEscapedText = $unescaped
$log.EqualToOriginal = $unescaped -eq $string

# show log
$log
