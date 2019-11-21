#requires -version 5

# Class [T2] is derived from [T1] defined below.
# ERROR: "Unable to find type [T1]."

class T2 : T1 {
	$P2
}

# Base class [T1] is defined after [T2].
# This is not possible in PowerShell.
# This is not a problem in C#.

class T1 {
	$P1
}
