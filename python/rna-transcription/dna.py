# to_rna = lambda xs: map ()
def transcribes_nucleobase(base):
    return transcribes_nucleobase.map[base]
transcribes_nucleobase.map = {'G': 'C', 'C': 'G', 'T':  'A', 'A': 'U'}

to_rna = lambda xs: str.join('', [transcribes_nucleobase(x) for x in xs])
