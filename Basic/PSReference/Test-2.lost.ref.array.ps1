
function Get-ParamType([object[]]$Param) {
	$Param[0].GetType().Name
}

# [ref] object
$var = [ref]'bar'

# PSReference, expected
Get-ParamType $var
Get-ParamType -Param @($var)

# String, UNEXPECTED
Get-ParamType -Param $var
