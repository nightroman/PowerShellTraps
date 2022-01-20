
# Results may depend on the current culture
"$PSCulture"
"$PSUICulture"

# True or False depending on the version and current culture
'ae' -ceq 'æ'

# Always False
'ae'.Equals('æ')
