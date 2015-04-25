
param($IterationCount = 1000)

# 1000 iterations take a tiny fraction of second
Measure-Command { for($i = 0; $i -lt $IterationCount; ++$i) {} }

# 1000 iterations with Write-Progress take seconds
Measure-Command { for($i = 0; $i -lt $IterationCount; ++$i) {Write-Progress -Activity Test -Status $i} }
