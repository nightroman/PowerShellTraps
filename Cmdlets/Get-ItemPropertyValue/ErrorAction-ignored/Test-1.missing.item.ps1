
#requires -version 5

# these commands silently continue or ignore errors as specified
Get-ItemPropertyValue HKLM:\SOFTWARE\NonExistentItem -Name 'NonExistentProperty' -ErrorAction SilentlyContinue
Get-ItemPropertyValue HKLM:\SOFTWARE\NonExistentItem -Name 'NonExistentProperty' -ErrorAction Ignore

# this is invoked because the above commands continued
'invoked'

# this command stops as specified
Get-ItemPropertyValue HKLM:\SOFTWARE\NonExistentItem -Name 'NonExistentProperty' -ErrorAction Stop

# this is not invoked because the above command stopped
'not invoked'
