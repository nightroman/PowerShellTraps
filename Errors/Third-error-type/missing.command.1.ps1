
<#
Fact 1: A missing command can be a not terminating error.

When this script is invoked in a clean session then the missing command is not
terminating. The test writes a non-terminating error and then 'Continued ...'.

But when this script is invoked from a try block then the missing command
becomes a terminating error, see "missing.command.3.ps1".
#>

$ErrorActionPreference = 'Continue'
missing-command
'Continued after missing-command'
