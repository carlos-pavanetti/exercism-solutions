from itertools import groupby

def encode(source):
    result = ""
    grouped = groupby(source)
    for k, g in grouped:
        groupSize = len(list(g))
        if groupSize > 1:
            result += str(groupSize) + k
        else:
            result += k
    return result

def decode(source):
    result = ""
    number = 1
    grouped = groupby(source, str.isdigit)
    for is_digit_group, values in grouped:
        values = list(values)
        values.reverse()
        
        if is_digit_group:
            number = 0
            pow10  = 1
            for digit in values:
                number += int(digit) * pow10
                pow10 *= 10
        else:
            char = values.pop()
            result += char * number
            while len(values) > 0:
                result += values.pop()
    return result
