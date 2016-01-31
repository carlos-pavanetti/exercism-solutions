def transform(old_set):
    new_set = {}
    for key, values in old_set.items():
        for value in values:
            value = value.lower()
            new_set[value] = key
    return new_set
