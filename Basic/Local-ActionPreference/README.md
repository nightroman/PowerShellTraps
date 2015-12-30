
Action preference variables and their default values:

- `$ErrorActionPreference` *Continue*
- `$WarningPreference` *Continue*
- `$DebugPreference` *SilentlyContinue*
- `$VerbosePreference` *SilentlyContinue*
- `$ProgressPreference` *Continue*

Valid values:

    PS> [enum]::GetNames([System.Management.Automation.ActionPreference])
    SilentlyContinue
    Stop
    Continue
    Inquire
    Ignore
    Suspend

*Ignore* was added in PowerShell 3.0. *Suspend* was added in PowerShell 4.0.

### The problem

Not global action preference variables are not strongly typed. As a result,
anything can be assigned to them, not necessarily valid values. For example,
typos will not be reported as errors, unlike with global variables.

As a result, cmdlets or scripts which in some rare cases use these variables
directly should not expect that their type is `ActionPreference` or they are
assigned to string or integer values representing enum values correctly.

Assigning valid string or integer values to local preference variables changes
default action preferences accordingly. Invalid values are treated as
*Continue* or *SilentlyContinue* depending on a variable, see tests.

#### Scripts

- [Test-1-1-assign-invalid-value.ps1](Test-1-1-assign-invalid-value.ps1) assigns invalid values in the current scope in try-catch blocks.
- [Test-1-2-script-scope.ps1](Test-1-2-script-scope.ps1) invokes it in the script scope, all variables are assigned to 'Invalid'.
- [Test-1-3-global-scope.ps1](Test-1-3-global-scope.ps1) invokes it in the global scope, all variable assignments fail.
- [Test-2-1-invalid-error-effect.ps1](Test-2-1-invalid-error-effect.ps1) - invalid `$ErrorActionPreference` is treated as *Continue*.
- [Test-2-2-invalid-warning-effect.ps1](Test-2-2-invalid-warning-effect.ps1) - invalid `$WarningPreference` is treated as *Continue*.
- [Test-2-3-invalid-debug-effect.ps1](Test-2-3-invalid-debug-effect.ps1) - invalid `$DebugPreference` is treated as *SilentlyContinue*.
- [Test-2-4-invalid-verbose-effect.ps1](Test-2-4-invalid-verbose-effect.ps1) - invalid `$VerbosePreference` is treated as *SilentlyContinue*.

---

- Microsoft Connect [692892](https://connect.microsoft.com/PowerShell/feedback/details/692892)
- [SplitPipeline/issues/12](https://github.com/nightroman/SplitPipeline/issues/12)
