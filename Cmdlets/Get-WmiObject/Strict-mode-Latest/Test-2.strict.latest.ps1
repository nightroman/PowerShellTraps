
Set-StrictMode -Version Latest

$c = Get-WmiObject -Class meta_class -Filter '__CLASS="Win32_Service"' -Amended
$c.Qualifiers['ThisQualifierDoesNotExist']
