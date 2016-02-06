local concat, insert = table.concat, table.insert

return function(dna_strand)
    local rna_nucleotides = {}
    local rna_conversion = {
        A = 'U',
        T = 'A',
        G = 'C',
        C = 'G',
    }

    for nucleotide in dna_strand:gmatch('.') do
        insert(rna_nucleotides, rna_conversion[nucleotide])
    end

    return concat(rna_nucleotides)
end
