local concat, insert = table.concat, table.insert

return function(dna_strand)
    local rna_nucleotides = {}
    for nucleotide in dna_strand:gmatch('.') do
        if nucleotide == 'A' then
            insert(rna_nucleotides, 'U')
        elseif nucleotide == 'T' then
            insert(rna_nucleotides, 'A')
        elseif nucleotide == 'G' then
            insert(rna_nucleotides, 'C')
        elseif nucleotide == 'C' then
            insert(rna_nucleotides, 'G')
        end
    end

    return concat(rna_nucleotides)
end
