import random
import string
from itertools import cycle


class Caesar(object):
    def encode(self, source):
        return ''.join(chr((ord(char.lower()) - 19 + 3) % 26 + 97)
                       for char in source if char.isalpha())

    def decode(self, source):
        return ''.join(chr((ord(char) - 19 - 3) % 26 + 97) for char in source)


class Cipher(object):
    def __init__(self, key=''):
        key = key or ''.join(random.choice(string.ascii_lowercase)
                             for _ in range(100))
        if not (key.islower() and key.isalpha()):
            raise ValueError

        self.key = key

    def encode(self, source):
        encoded = []
        iter_key = cycle(self.key)

        for char in source.lower():
            if not char.isalpha():
                continue
            key = ord(next(iter_key))
            encoded.append(chr((ord(char) + key - 12) % 26 + 97))
        return ''.join(encoded)

    def decode(self, source):
        decoded = []
        iter_key = cycle(self.key)

        for char in source.lower():
            if not char.isalpha():
                continue
            key = ord(next(iter_key))
            decoded.append(chr((ord(char) - key) % 26 + 97))
        return ''.join(decoded)
