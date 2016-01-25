
$Version = $PSVersionTable.PSVersion.Major
if ($Version -eq 2) {return task skip2}

task Test-1.multiline.object {
	$r = try {.\Test-1.multiline.object.ps1} catch {$_}
	if ($Version -eq 5) {
		equals $r.a 1
		equals $r.b 2
	}
	else {
		equals $r.FullyQualifiedErrorId 'System.ArgumentException,Microsoft.PowerShell.Commands.ConvertFromJsonCommand'
	}
}

task Test-1.oneline.objects {
	$r = .\Test-1.oneline.objects.ps1
	equals $r.Count 2
	equals $r[0].a 1
	equals $r[1].a 2
}

task Test-2.multiline.object.empty {
	$r = try {.\Test-2.multiline.object.empty.ps1} catch {$_}
	if ($Version -eq 5) {
		equals $r.Count 4
		equals $r[0] 2
		equals $r[1] $true
		equals $r[2] $null
		equals $r[3].b 2
	}
	else {
		equals $r.FullyQualifiedErrorId 'System.ArgumentException,Microsoft.PowerShell.Commands.ConvertFromJsonCommand'
	}
}

task Test-2.oneline.objects.empty {
	$r = .\Test-2.oneline.objects.empty.ps1
	equals $r.Count 7
	equals $r[0] 4
	equals $r[1] $true
	equals $r[2] $true
	equals $r[3].a 1
	equals $r[4] $null
	equals $r[5].a 2
	equals $r[6] $null
}

task Test-3.multiline.objects {
	$r = try {.\Test-3.multiline.objects.ps1} catch {$_}
	equals $r.Count 2
	equals $r[0].a 1
	equals $r[1].FullyQualifiedErrorId 'System.ArgumentException,Microsoft.PowerShell.Commands.ConvertFromJsonCommand'
}

task Test-3.oneline.objects.first.empty {
	$r = try {.\Test-3.oneline.objects.first.empty.ps1} catch {$_}
	if ($Version -eq 5) {
		equals $r.Count 2
		equals $r[0] $null
		equals $r[1].FullyQualifiedErrorId 'System.ArgumentException,Microsoft.PowerShell.Commands.ConvertFromJsonCommand'
	}
	else {
		equals $r.Count 3
		equals $r[0] $null
		equals $r[1].a 1
		equals $r[2].a 2
	}
}
