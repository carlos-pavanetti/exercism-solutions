def detect_anagrams(word, input_list):
    return [anagram for anagram in input_list if is_anagrams(word, anagram)]


def is_anagrams(A, B):
    lowerA = A.lower()
    lowerB = B.lower()
    if lowerA == lowerB:
        return False

    sortedA = sorted(lowerA)
    sortedB = sorted(lowerB)
    if sortedA == sortedB:
        return True
    return False
