
# Given a simple array which has been boxed in a PSObject
[PSObject]$o = @(1, 2)

# Gets Object[], as expected
$o.GetType().Name

# ConvertTo-Json gets an unexpected wrapper of data
ConvertTo-Json $o
