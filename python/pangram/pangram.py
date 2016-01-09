def is_pangram(word):
    if word == '':
        return False

    low_word = word.lower()
    for ichar in range(ord('a'), ord('z') + 1):
        if not chr(ichar) in low_word:
            return False
    return True
# pangram = (== 26) . length . Set.filter (`elem` ['a'..'z']) . Set.fromList . map (toLower)
