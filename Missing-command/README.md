
It looks like constant use of either error action preference *Stop* or `try` or
`trap` blocks in scripts is a good idea. Otherwise simple typos in command
names may cause issues because invocation may continue.

Note that the default error action preference is *Continue*.

Example:

    if (!(Initialize-Reactor)) {
        return
    }
    Start-Reactor

If `Initialize-Reactor` is missing or there is a typo then `Start-Reactor` is
invoked after an error. It presumably starts not initialized as designed.
