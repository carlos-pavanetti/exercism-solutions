def slices(word, size):
    if len(word) < size:
        raise ValueError("Word is shorter than serie required")
    if size == 0:
        raise ValueError("0-digit series is invalid")
    series = []
    while len(word) >= size:
        serie = [int(digit) for digit in word[:size]]
        series.append(serie)

        word = word[1:]
    return series
