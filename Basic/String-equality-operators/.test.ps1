
$Version = [Version]$PSVersionTable.PSVersion
${7.2.1} = [Version]'7.2.1'

task Test-1 {
	$r = ./Test-1.ps1
	equals $r.Count 2
	equals $r[0] $true
	equals $r[1] $false
}

task Test-2 {
	($r = ./Test-2.ps1)
	$Culture, $UICulture, $r1, $r2 = $r

	equals $r2 $false
	if ($Version -ge ${7.2.1}) {
		if ($Culture -eq 'en-GB' -and $UICulture -eq 'en-US') {
			equals $r1 $false
			return
		}
		if ($Culture -eq 'en-GB' -and $UICulture -eq 'en-GB') {
			equals $r1 $false
			return
		}
		if ($Culture -eq 'en-US' -and $UICulture -eq 'en-US') {
			"r1=$r1 used to be true but keeps changing in GHA"
			return
		}

		Write-Warning "Untested cultures $Culture, $UICulture"
		return
	}
	elseif ($Version.Major -ge 5) {
		equals $r1 $true
		return
	}

	Write-Warning "Untested version $Version"
}
