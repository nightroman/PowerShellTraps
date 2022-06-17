# LastExitCode

### Consider using $global:LastExitCode instead of $LastExitCode

Help *about_Automatic_Variables*:

    $LastExitCode
       Contains the exit code of the last Windows-based program that was run.

The typical use case, assuming 0 is for success:

````powershell
    <invoke a program>
    if ($LastExitCode -eq 0) {
        <success>
    }
    else {
        <failure>
    }
````

The above pattern has some vulnerability and may work incorrectly. It turns out
`<invoke a program>` sets the *global* automatic variable. Thus, ideally, exactly
the global variable should be checked, i.e. `$global:LastExitCode`. Otherwise,
if for some reason (mistake) a parent scope sets its own variable,
`$LastExitCode = <something>`, then this `<something>` will be returned
by `$LastExitCode` instead of the actual last exit code.

The script [Test-1.problem.ps1](Test-1.problem.ps1) shows the issue.

***

- [StackOverflow](http://stackoverflow.com/q/10943554/323582)
