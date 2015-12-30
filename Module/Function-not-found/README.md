
[1]: http://stackoverflow.com/q/25033346/323582

If a module imports functions from several modules and a function from one
module calls a function from another then the latter may be not found. The
script [Test-Fails.ps1](Test-Fails.ps1) shows the problem.

This problem is specific for a module function which imports other modules. If
a script function repeats the same scenario with other modules then it works,
see [Test-Works.ps1](Test-Works.ps1).

- Stack Overflow question [Scope of functions defined in modules when used in psake tasks][1]
