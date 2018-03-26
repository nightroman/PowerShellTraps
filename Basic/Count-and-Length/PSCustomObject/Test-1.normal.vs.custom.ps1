
#requires -Version 3

# some "normal" object
$normal = $Host

# some "custom" object
$custom = [PSCustomObject]@{Name = 'Joe'; Age = 42}

# turn off the strict mode, otherwise both fail
Set-StrictMode -Off

# "normal" objects have surrogate Count
"normal.Count: $($normal.Count)"

# v6.1.0 -- fixed
# "custom" objects do not have surrogate Count
# $custom.Count is either $null or error in the strict mode
"custom.Count: $($custom.Count)"
