
# to be shown and tested
$results = New-Object System.Collections.Specialized.OrderedDictionary

# this command gets full file paths
$results.strings1 = [string[]](Get-ChildItem . -Include *)

# this command gets just file names
# (fixed in v6.1.0-preview.3)
$results.strings2 = [string[]](Get-ChildItem .)

# output
$results
