import random
import string
from itertools import cycle


def normalize_to_number(char):
    remainder = ord('a') % 26
    return (ord(char.lower()) - remainder) % 26


def normalize_to_char(number):
    ord_a = ord('a')
    return chr(number % 26 + ord_a)


def shift(char, key):
    return normalize_to_char(key + normalize_to_number(char))


class Caesar(object):
    def encode(self, source):
        return ''.join(shift(char, 3) for char in source if char.isalpha())

    def decode(self, source):
        return ''.join(shift(char, -3) for char in source)


class Cipher(object):
    def __init__(self, key=''):
        self.key = key or ''.join(random.choice(string.ascii_lowercase)
                                  for _ in range(100))

        if not (self.key.islower() and self.key.isalpha()):
            raise ValueError

    def encode(self, source):
        encoded = []
        iter_key = cycle(self.key)

        for char in source.lower():
            if not char.isalpha():
                continue
            key = normalize_to_number(next(iter_key))
            encoded.append(shift(char, key))
        return ''.join(encoded)

    def decode(self, source):
        decoded = []
        iter_key = cycle(self.key)

        for char in source.lower():
            if not char.isalpha():
                continue
            key = normalize_to_number(next(iter_key))
            decoded.append(shift(char, -key))
        return ''.join(decoded)
