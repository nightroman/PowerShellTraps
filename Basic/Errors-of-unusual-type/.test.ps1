$Version = $PSVersionTable.PSVersion.Major

# Invokes PowerShell with some extra steps.
function Invoke-Test($Command) {
	$text = '$ErrorView = "NormalView"; {0}' -f $Command
	$bytes = [System.Text.Encoding]::Unicode.GetBytes($text)
	$encoded = [System.Convert]::ToBase64String($bytes)
	Invoke-PowerShell -NoProfile -EncodedCommand $encoded > z.txt
	Get-Content z.txt
	remove z.txt
}

task missing.command.1 {
	($r = exec {Invoke-Test .\missing.command.1.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : CommandNotFoundException*Continued after missing-command*')
}
task missing.command.2 {
	($r = .\missing.command.2.ps1)
	equals $r 'Caught CommandNotFoundException'
}
task missing.command.3 {
	($r = .\missing.command.3.ps1)
	equals $r 'Caught CommandNotFoundException'
}

task test.2.1.division.by.zero {
	($r = exec {Invoke-Test .\test.2.1.division.by.zero.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : RuntimeException*Continued after error*')
}
task test.2.2.division.by.zero {
	($r = .\test.2.2.division.by.zero.ps1)
	equals $r 'Caught RuntimeException'
}

task test.3.1.method.arguments {
	($r = exec {Invoke-Test .\test.3.1.method.arguments.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : MethodCountCouldNotFindBest*Continued after error*')
}
task test.3.2.method.arguments {
	($r = .\test.3.2.method.arguments.ps1)
	equals $r 'Caught MethodCountCouldNotFindBest'
}

task test.4.1.cannot.convert {
	($r = exec {Invoke-Test .\test.4.1.cannot.convert.ps1} | Out-String)
	if ($Version -eq 2) {
		assert ($r -like '*FullyQualifiedErrorId : RuntimeException*Continued after error*')
	}
	else {
		assert ($r -like '*FullyQualifiedErrorId : InvalidCastParseTargetInvocationWithFormatProvider*Continued after error*')
	}
}
task test.4.2.cannot.convert {
	($r = .\test.4.2.cannot.convert.ps1)
	if ($Version -eq 2) {
		equals $r 'Caught RuntimeException'
	}
	else {
		equals $r 'Caught InvalidCastParseTargetInvocationWithFormatProvider'
	}
}

task test.5.1.missing.type {
	($r = exec {Invoke-Test .\test.5.1.missing.type.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : TypeNotFound*Continued after error*')
}
task test.5.2.missing.type {
	($r = .\test.5.2.missing.type.ps1)
	equals $r 'Caught TypeNotFound'
}

task test.6.1.missing.property.strict {
	($r = exec {Invoke-Test .\test.6.1.missing.property.strict.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : PropertyNotFoundStrict*Continued after error*')
}
task test.6.2.missing.property.strict {
	($r = .\test.6.2.missing.property.strict.ps1)
	equals $r 'Caught PropertyNotFoundStrict'
}

task test.7.1.missing.variable.strict {
	($r = exec {Invoke-Test .\test.7.1.missing.variable.strict.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : VariableIsUndefined*Continued after error*')
}
task test.7.2.missing.variable.strict {
	($r = .\test.7.2.missing.variable.strict.ps1)
	equals $r 'Caught VariableIsUndefined'
}

task test.8.1.command.parameter {
	($r = exec {Invoke-Test .\test.8.1.command.parameter.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : NamedParameterNotFound*Continued after error*')
}
task test.8.2.command.parameter {
	($r = .\test.8.2.command.parameter.ps1)
	equals $r 'Caught NamedParameterNotFound,Microsoft.PowerShell.Commands.CopyItemCommand'
}

task test.9.1.VariableNotWritable {
	($r = exec {Invoke-Test .\test.9.1.VariableNotWritable.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : VariableNotWritable*Continued after error*')
}
task test.9.2.VariableNotWritable {
	($r = .\test.9.2.VariableNotWritable.ps1)
	equals $r 'Caught VariableNotWritable'
}

task test.10.1.provider.NotSupported {
	($r = exec {Invoke-Test .\test.10.1.provider.NotSupported.ps1} | Out-String)
	assert ($r -like '*FullyQualifiedErrorId : NotSupported*Continued after error*')
}
task test.10.2.provider.NotSupported {
	($r = .\test.10.2.provider.NotSupported.ps1)
	equals $r 'Caught NotSupported,Microsoft.PowerShell.Commands.GetChildItemCommand'
}

task test.11.1.exception {
	($r = exec {Invoke-Test .\test.11.1.exception.ps1} | Out-String)
	if ($Version -eq 2) {
		assert ($r -like '*Oops*FullyQualifiedErrorId : DotNetMethodException*Continued after error*')
	}
	else {
		assert ($r -like '*Oops*FullyQualifiedErrorId : Exception*Continued after error*')
	}
}
task test.11.2.exception {
	($r = .\test.11.2.exception.ps1)
	if ($Version -eq 2) {
		equals $r 'Caught DotNetMethodException'
	}
	else {
		equals $r 'Caught Exception'
	}
}
