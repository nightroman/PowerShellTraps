
Set-StrictMode -Version 2

$c = Get-WmiObject -Class meta_class -Filter '__CLASS="Win32_Service"' -Amended
$r = $c.Qualifiers['ThisQualifierDoesNotExist']
$null -eq $r
