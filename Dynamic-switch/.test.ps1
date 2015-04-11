
$v3 = $PSVersionTable.PSVersion.Major -ge 3

task dinamic.switch.works -if $v3 {
	.\dynamic.switch.works.ps1
}

task dinamic.switch.fails -if $v3 {
	($r = try {.\dynamic.switch.fails.ps1} catch {$_})
	assert ('InvalidArgument: (:) [Get-ChildItem], ParameterBindingException' -eq $r.CategoryInfo)
}
