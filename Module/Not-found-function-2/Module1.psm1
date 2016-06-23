
function Invoke-Test {
	# Import required functions
	Import-Module .\Module2.psm1
	Import-Module .\Module3.psm1

	# Call a function defined in Module3
	Set-Something
}
