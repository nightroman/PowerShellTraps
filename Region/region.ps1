
<#
.Synopsis
	Open it in ISE and see region and not region samples.
#>

#####################################################################
# REGIONS

#region
# OK
#endregion

#region my
# OK
#endregion

	#region my
	# OK
	#endregion

$x = 42 #regionGarbage
$y = 13 # This region is odd.
$x + $y #endregionAnotherGarbage

#####################################################################
# NOT REGIONS

#Region My
# This is expected to be a region, PowerShell is case insensitive.
# Compare with #Requires.
#EndRegion

##region my
# This is not a region due to '##', fine, just testing.
#endregion
