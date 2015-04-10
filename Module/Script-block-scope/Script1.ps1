
# set the default global message
$global:message = 'Default global message.'

function Invoke-ScriptBlockParameter {
	param(
		[scriptblock]$properties = {}
	)

	# set the default local message
	$message = 'Default local message.'
	"Local message: $message"

	# set $message by a script block defined here
	$defaults = {$message = 'New local message.'}
	. $defaults

	# $message is correctly set to 'New local message.'
	"Local message: $message"

	# set $message by a script block defined outside
	. $properties

	# $message depends on where this function is defined:
	# in a script: 'New custom message.'
	# in a module: 'New local message.'
	"Local message: $message"

	# $global:message depends on where this function is defined:
	# in a script: 'Default global message.'
	# in a module: 'Default global message.' or 'New custom message.', see .test.ps1
	"Global message: $global:message"
}
