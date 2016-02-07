
PowerShell classes can be defined by commands like scripts, functions, script
blocks and imported to the current scope using dot-sourcing.

Such dot-sourced classes can be used for basic operations like instantiation
and invocation of members. See the script [Test-1.can.use.ps1](Test-1.can.use.ps1).

It is not possible though to define a new class derived from a dot-sourced
class. See the script [Test-2.cannot.derive.ps1](Test-2.cannot.derive.ps1).

See also [Parser-fails-on-custom-type](../Parser-fails-on-custom-type). The
issue is similar. A possible workaround is to move the definition of derived
classes to a script and dot-source it after dot-sourcing base classes.
