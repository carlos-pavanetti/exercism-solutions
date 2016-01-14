def encode(source):
    pivot = 0
    result = ""
    while pivot < len(source):
        count = 0
        char = source[pivot]
        while  pivot < len(source) and char == source[pivot]:
            count += 1
            pivot += 1
        if count > 1:
            result += str(count) + char
        else:
            result += char
    return result

def decode(source):
    result = ""
    number = ""
    for char in source:
        if char.isdigit():
            number += char
        else:
            if len(number) > 0:
                number = int(number)
            else:
                number = 1
            result += (char * number)
            number = ""
    return result
