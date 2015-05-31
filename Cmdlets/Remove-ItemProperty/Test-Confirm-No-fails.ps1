
<#
	This script creates the registry key "HKCU:\77eeaf81-0b82-4b2e-93f3-ce464d61b955"
	with the property "p1". The GUID is generated, presumably such a key should not
	exist before the test.

	Remove-ItemProperty -Confirm is invoked in order to remove the property "p1"
	When the prompt is shown answer 'No', i.e. type 'n' and Enter.
	As a result, Remove-ItemProperty fails.

	The test registry key is removed after the test.
#>

# the test registry key path
$path = 'HKCU:\77eeaf81-0b82-4b2e-93f3-ce464d61b955'

# ensure the registry key
if (!(Test-Path $path)) {
	$null = New-Item $path
}

try {
	# ensure the key property p1
	$null = New-ItemProperty $path p1 -PropertyType DWORD -Force

	# remove the property with -Confirm, answer 'No', it fails
	Remove-ItemProperty -Path $path -Name p1 -Confirm}finally {	# remove the test key	Remove-Item $path}