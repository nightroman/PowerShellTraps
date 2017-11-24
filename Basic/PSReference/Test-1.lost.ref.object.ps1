
function Get-ParamType([object]$Param) {
	$Param.GetType().Name
}

# [ref] object
$var = [ref]'bar'

# PSReference, expected
Get-ParamType $var

# String, UNEXPECTED
Get-ParamType -Param $var
