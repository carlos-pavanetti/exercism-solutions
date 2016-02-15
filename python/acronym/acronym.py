import re


def abbreviate(sentence):
    abbreviation = []
    for word in re.findall(r"[A-Z]+[a-z]*|[a-z]+", sentence):
        abbreviation.append(word[0].upper())

    return "".join(abbreviation)
