
$Version = [version]$PSVersionTable.PSVersion
${7.2.0} = [version]'7.2.0'
${7.1.1} = [version]'7.1.1'

task Test-1.issue {
	($r = try {.\Test-1.issue.ps1} catch {$_})

	# 7.0.2-preview.4
	if ($Version -ge ${7.2.0}) {
		equals $r done # expected
	}
	# GHA
	elseif ($Version -ge ${7.1.1}) {
		assert ($r -like 'fatal: not a git repository*')
	}
	# v2+
	else {
		assert ($r -like 'fatal: not a git repository*')
	}
}

task Test-2.workaround {
	$r = .\Test-2.workaround.ps1
	equals $r $true
}
