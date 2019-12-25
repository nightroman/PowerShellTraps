$ErrorActionPreference = 'SilentlyContinue'

'before throw'
Write-Error 'oops, terminating' -ErrorAction Stop
'after throw, not happening'
