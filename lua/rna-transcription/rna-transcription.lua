local concat, insert = table.concat, table.insert

return function(dna_strand)
    return dna_strand:gsub('%a',  { C = 'G', G = 'C', A = 'U', T = 'A' })
end
