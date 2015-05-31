
# Internal module function. The tests show that it can conflict with an alias
# with the same name. Thus, it looks like a good idea to use Verb-Noun even for
# internal functions. This minimizes chances of conflicts, assuming aliases are
# not normally named Verb-Noun.
function MyCommand {
	'module function MyCommand'
}

# Exported module function which invokes an internal function.
function Test-ModuleFunction {
	MyCommand
}

# Export just Test-ModuleFunction.
Export-ModuleMember -Function Test-ModuleFunction
