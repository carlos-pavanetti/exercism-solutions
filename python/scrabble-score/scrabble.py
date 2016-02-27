letter_score = {
    "aeioulnrst": 1,
    "dg":         2,
    "bcmp":       3,
    "fhvwy":      4,
    "k":          5,
    "jx":         8,
    "qz":        10
}


def score(word):
    if not word.isalpha():
        return 0

    result_score = 0
    for letter in word.lower():
        for score_group, score_points in letter_score.items():
            if letter in score_group:
                result_score += score_points
                break
    return result_score
