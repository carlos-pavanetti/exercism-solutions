def transcribes_nucleobase(base):
    return transcribes_nucleobase.map[base]
transcribes_nucleobase.map = {'G': 'C', 'C': 'G', 'T':  'A', 'A': 'U'}


def to_tna(xs):
    return str.join('', [transcribes_nucleobase(x) for x in xs])
