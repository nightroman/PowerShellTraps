
$modules = @(
	Get-PSSnapin -Name Microsoft.PowerShell.*
	Get-Module -ListAvailable -Name Microsoft.PowerShell.*
)

foreach($module in $modules) {
	foreach($command in Get-Command -Module $module.Name) {
		foreach ($parameter in $command.Parameters.Values) {
			foreach ($attr in $parameter.Attributes) {
				if ($attr -is [System.Management.Automation.ParameterAttribute]) {
					if ($attr.ValueFromRemainingArguments) {
						[PSCustomObject]@{
							Command = $command.Name
							Parameter = $parameter.Name
						}
					}
				}
			}
		}
	}
}
