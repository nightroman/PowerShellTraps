
If a module function name X, internal or exposed, is accidentally the same as
an existing in the session alias and other module functions call X then this
alias may be invoked instead of the function X.

It looks like a good idea to use the Verb-Noun convention even for internal
module function names. This minimizes chances of conflicts. Aliases are not
normally called Verb-Noun.
