
# These expressions produce "" and `"
$('""')
$('`"')

# But in double quoted strings they both result in "
".. $('""') .."
".. $('`"') .."
