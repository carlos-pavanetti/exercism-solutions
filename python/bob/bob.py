def hey(what):
    if what.isupper(): # you yell me?
        return 'Whoa, chill out!'
    if what.endswith('?'): # w0t?
        return 'Sure.'
    if what.isspace() or what == '': # saying nothing
        return 'Fine. Be that way!'
    return 'Whatever.'
