def hey(what):
    what = what.rstrip() # remove whitespaces at end

    if what.isupper(): # you yell me?
        return 'Whoa, chill out!'
    if what.endswith('?'): # w0t?
        return 'Sure.'
    if what == '': # saying nothing
        return 'Fine. Be that way!'
    return 'Whatever.'
