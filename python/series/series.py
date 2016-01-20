def slices(word, size):
    if len(word) < size:
        raise ValueError("Word is shorter than serie required")
    if size == 0:
        raise ValueError("0-digit series is invalid")
    return slices_helper(word, size)


def slices_helper(word, size):
    if len(word) < size:
        return []
    serie = [int(digit) for digit in word[:size]]
    return [serie] + slices_helper(word[1:], size)
