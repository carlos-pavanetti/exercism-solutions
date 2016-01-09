def distance(strA, strB):
    if len(strA) != len(strB):
        return False

    hamming_distance = 0

    for index in range(len(strA)):
        if strA[index] != strB[index]:
            hamming_distance += 1
    return hamming_distance
