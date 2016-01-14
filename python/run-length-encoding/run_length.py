def encode(source):
    count = 1 # including first letter
    pivot = 1
    result = ""
    while pivot < len(source):
        char = source[pivot]
        while  pivot < len(source) and char == source[pivot]:
            count += 1
            pivot += 1
        result += str(count) + char
        count = 0
    return result

def decode(source):
    return ""
