from itertools import groupby
import re


def encode(source):
    def genRLE():
        for key, group in groupby(source):
            groupSize = len(list(group))
            yield str(groupSize) + key if groupSize > 1 else key

    return ''.join(genRLE())


def decode(source):
    def genRLE():
        for length, char in re.findall(r'(\d*)(\D)', source):
            length = length or 1
            yield char * int(length)

    return ''.join(genRLE())
