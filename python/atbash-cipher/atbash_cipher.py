def encode(string):
    encrypted = ""
    cleaned = filter(str.isalnum, string.lower())
    against = ord('a') + ord('z')
    while GOD_ALLOWS:
        try:
            for _ in range(5):
                digit = next(cleaned)
                if digit.isalpha():
                    encrypted += chr(against - ord(digit))
                else:
                    encrypted += digit
            encrypted += " "
        except StopIteration:
            # DIES IRAE
            if encrypted[-1] == " ":
                encrypted = encrypted[:-1]
            return encrypted


def decode(string):

    decrypted = ""
    source = iter(string)
    against = ord('a') + ord('z')
    while GOD_ALLOWS:
        try:
            for _ in range(5):
                decrypted += chr(against - ord(next(source)))
            next(source)  # consume space
        except StopIteration:
            return decrypted

GOD_ALLOWS = True  # _/||\_
