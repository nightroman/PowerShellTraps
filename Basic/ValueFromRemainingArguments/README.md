## Parameters with ValueFromRemainingArguments

The parameter attribute `ValueFromRemainingArguments` is a handy feature in
special cases. All unknown parameters and arguments go to this parameter
value. A command processes it as required by its design.

But such a parameter introduces unfortunate side effects. For example, if an
existing parameter name is misspelled then it is not an error anymore. Instead,
the wrong parameter goes to `ValueFromRemainingArguments`. A command may even
work without errors with such a mistake. But the results are probably wrong.

Some known built-in commands with `ValueFromRemainingArguments` parameters,
see [Get-VFRACommandParameter.ps1](Get-VFRACommandParameter.ps1):

    Command        Parameter
    -------        ---------
    ForEach-Object RemainingScripts
    ForEach-Object ArgumentList
    Get-Command    ArgumentList
    New-Module     ArgumentList
    Read-Host      Prompt
    Trace-Command  ArgumentList
    Write-Host     Object
    Write-Output   InputObject

The script [Test-1.ps1](Test-1.ps1) shows how a typo in the parameter name of
`Get-Command` is not treated as an error and the command does not fail, too.
But it gets a wrong result.

In v7.1.0-preview.2 the behaviour changed. `Get-Command` fails with some not
clear error due to the apparently misspelled parameter. In the ideal world we
would get some "invalid parameter" error. But in reality the misspelled input
goes to `ArgumentList` due to its `ValueFromRemainingArguments` and the error
looks cryptic or misleading.
