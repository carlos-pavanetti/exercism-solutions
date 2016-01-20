def encode(string):
    def cipher_method(x): return cipher(x) if x.isalpha() else x

    cleaned = filter(str.isalnum, string.lower())
    encrypted = extracted_method(cleaned, cipher_method, False)

    if encrypted[-1].isspace():
        encrypted = encrypted[:-1]
    return encrypted


def decode(string):
    return extracted_method(iter(string), cipher, True)


def extracted_method(source, cipher_method, consume):
    result = ""
    while GOD_ALLOWS:
        try:
            for _ in range(5):
                result += cipher_method(next(source))
            if consume:
                next(source)
            else:
                result += " "
        except StopIteration:
            return result


def cipher(digit):
    return chr(against - ord(digit))

against = ord('a') + ord('z')
GOD_ALLOWS = True  # _/||\_
