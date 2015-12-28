
# ScriptBlock
$script = {42}
$script.GetType().Name

# export it
$script | Export-Clixml z.clixml

# it is represented as `<SBK>42</SBK>`
Get-Content z.clixml | Where-Object {$_.Contains('<SBK>')}

# import it back, it is rehydrated as String
$script = Import-Clixml z.clixml
$script.GetType().Name

# clean
Remove-Item z.clixml
