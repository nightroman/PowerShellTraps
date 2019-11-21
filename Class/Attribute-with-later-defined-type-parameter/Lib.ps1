# Classes:
# MyT1 - the class with the attribute [KnownType([T2])]
# MyT2 - the class which type is referenced above -- an issue in PowerShell

[KnownType([T2])]
class T1 {
	$P1
}

class T2 : T1 {
	$P2
}
