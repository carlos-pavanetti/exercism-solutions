def transform(old_set):
    new_set = {}
    for key, values in old_set.items():
        for value in values:
            new_set[value.lower()] = key
    return new_set
