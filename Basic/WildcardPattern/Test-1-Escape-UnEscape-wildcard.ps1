
$log = New-Object System.Collections.Specialized.OrderedDictionary

# 2 backticks
$string = '``text``'

# original text
$log.OriginalText = $string

# escape the string with double backticks
$escaped = [Management.Automation.WildcardPattern]::Escape($string)

# gets unexpected ``text``, expected would be ````text````
$log.EscapedText = $escaped

# unescape
$unescaped = [Management.Automation.WildcardPattern]::UnEscape($escaped)

# gets `text` which is not equal to the original
$log.UnEscapedText = $unescaped

# try to match the original string ($false, must be $true)
$log.MatchesTheOriginal = $string -like $escaped

# show log
$log
