def is_pangram(word):
    if word == '':
        return False

    low_word = word.lower()
    for ichar in range(ord('a'), ord('z') + 1):
        if not chr(ichar) in low_word:
            return False
    return True
