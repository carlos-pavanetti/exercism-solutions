def encode(source):
    normalized_source = normalizePlaintext(source)

    if not normalized_source:
        return ''

    segments = segmentText(normalized_source)
    transposed_cipher = transpose(segments)

    encoded = []
    for tp in transposed_cipher:
        encoded.append("".join(list(tp)).strip())
    return " ".join(encoded)


def normalizePlaintext(text):
    return [char.lower() for char in text if char.isalnum()]


def segmentText(text):
    size = 0
    while size**2 < len(text):
        size += 1

    text += " " * ((size**2) - len(text))
    segments = []
    for index in range(0, len(text), size):
        segments.append(text[index: index + size])

    return segments


def transpose(segments):
    return zip(*segments)
