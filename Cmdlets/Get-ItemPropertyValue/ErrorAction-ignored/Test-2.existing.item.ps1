
<#
	This script shows two issues

	1. Invoke it is a clean session

		PowerShell.exe -NoProfile .\Test-2.existing.item.ps1

	As a result, Get-ItemPropertyValue ignores ErrorAction and writes non-terminating errors.

	2. Invoke from with `try` or `trap` block, e.g. use tests

		Test-3.unexpected.stop.try.ps1
		Test-4.unexpected.stop.trap.ps1

	As a result, Get-ItemPropertyValue ignores ErrorAction and writes terminating errors.
#>

#requires -version 5

# these commands are expected to not write errors but they do in some cases
# these commands are expected to continue but they stop in some cases
Get-ItemPropertyValue HKLM:\SOFTWARE -Name 'NonExistentProperty' -ErrorAction SilentlyContinue
Get-ItemPropertyValue HKLM:\SOFTWARE -Name 'NonExistentProperty' -ErrorAction Ignore

# in some cases this is not invoked because the above commands stopped
'invoked #1'

# this command is expected to stop but it writes an error and continues
Get-ItemPropertyValue HKLM:\SOFTWARE -Name 'NonExistentProperty' -ErrorAction Stop

# in some cases this is invoked because the above command does not stop as expected
'invoked #2'
