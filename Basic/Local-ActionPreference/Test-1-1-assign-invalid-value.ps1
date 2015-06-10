
<#
	If this script is invoked not in the global scope then all preference
	variables below are assigned with 'Invalid' values successfully.

	If this script is invoked in the global scope then all assignments throw
	errors "Cannot cast".
#>

try { ($ErrorActionPreference = 'Invalid') } catch { "ErrorActionPreference: $_" }
try { ($WarningPreference = 'Invalid') } catch { "WarningPreference: $_" }

try { ($DebugPreference = 'Invalid') } catch { "DebugPreference: $_" }
try { ($VerbosePreference = 'Invalid') } catch { "VerbosePreference: $_" }

try { ($ProgressPreference = 'Invalid') } catch { "ProgressPreference: $_" }
