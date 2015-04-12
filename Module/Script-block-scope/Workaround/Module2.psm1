
function Invoke-ScriptBlockParameter {
	param(
		[scriptblock]$properties = {}
	)

	# the default value to be changed by the script block
	$message = 'Default local message.'

	# invoke the script block using this trick
	. $MyInvocation.MyCommand.Module $properties

	# show the changed value
	"Local message: $message"
}
