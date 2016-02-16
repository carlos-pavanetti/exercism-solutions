from random import choice
from string import ascii_lowercase
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
        self.key = key or Cipher.generate_random_key()

        if not self.is_key_valid():
            raise ValueError

    def encode(self, source, inverse=False):
        result = []
        signal_factor = inverse and -1 or 1
        iter_key = cycle(self.key)

        for char in source.lower():
            if not char.isalpha():
                continue
            key = normalize_to_number(next(iter_key)) * signal_factor
            result.append(shift(char, key))

        return ''.join(result)

    def decode(self, source):
        return self.encode(source, inverse=True)

    def generate_random_key(size=100):
        return ''.join(choice(ascii_lowercase) for _ in range(size))

    def is_key_valid(self):
        return self.key.isalpha() and self.key.islower()
