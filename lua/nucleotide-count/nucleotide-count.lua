local dna = {}
local dna_mt = {__index = dna}

dna.new = function(_, strand)
    local self = {}
    self.strand = strand

    local nucleotide_counts = { A = 0, T = 0, C = 0, G = 0 }

    for nucleotide in strand:gmatch('[ACGT]') do
        nucleotide_counts[nucleotide] = nucleotide_counts[nucleotide] + 1
    end
    self.nucleotideCounts = nucleotide_counts

    return setmetatable (self, dna_mt)
end

dna.count = function(self, nucleotide)
    if not ('ACGT'):find(nucleotide) then
        error "Invalid Nucleotide"
    end

    return self.nucleotideCounts[nucleotide]
end

return dna
