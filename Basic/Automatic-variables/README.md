
### Automatic variables used as local or parameters

Automatic variables are maintained by the core and normally should not be used
as local variables or parameters. This is easy to forget, especially with some
simple variable names.

See help about automatic variables

    help about_Automatic_Variables

****
#### `$Args` and `$Input` as parameters

**$Args**

> Contains an array of the undeclared parameters and/or parameter values that
are passed to a function, script, or script block.

*Test-1.Args.ps1* shows that `$Args` can be used as a parameter but it does not
work as one may expect.

**$Input**

> Contains an enumerator that enumerates all input that is passed to a
function.

*Test-2.Input.ps1* shows that `$Input` can be used as a parameter but it does not
work as one may expect.

- [Stack Overflow question](http://stackoverflow.com/q/30546750/323582)
- [Stack Overflow question](http://stackoverflow.com/q/11009834/323582)

****
#### `$$` and `$^` as local variables

**$$**

> Contains the last token in the last line received by the session.

**$^**

> Contains the first token in the last line received by the session.

It is unlikely that `$^` is used accidentally. But `$$` is the easiest to type
variable, so it may be tempting to use it. In many cases these variables may be
used without problems but there are cases with issues.

*Test-3.Dollar.ps1* and *Test-4.Caret.ps1* show a case when `$$` and `$^` do
not work as normal variables in PowerShell v3+.

****
#### `$This` as a local variable

**$This**

> In a script block that defines a script property or script method, the $This
variable refers to the object that is being extended.

*Test-5.This.ps1* shows an exotic case that may cause a crash or a strange
error PowerShell v3. In PowerShell v2 works with expected errors. See the
testing commands in the comments.

- [Microsoft Connect](https://connect.microsoft.com/PowerShell/feedback/details/1423742)
