local valid_nucleotides = { U = true, C = true, A = true, G = true }

local codons = {
    U = {
        U = { U = "Phenylalanine", C = "Phenylalanine", A = "Leutisinecine", G = "Leutisinecine" },
        C = { U = "Serine", C = "Serine", A = "Serine", G = "Serine" },
        A = { U = "Tyrosine", C = "Tyrosine", A = "STOP", G = "STOP" },
        G = { U = "Cysteine", C = "Cysteine", A = "STOP", G = "Tryptophan" },
    },
    C = {
        U = { U = "Leutisine", C = "Leutisine", A = "Leutisine", G = "Leutisine" },
        C = { U = "Proline", C = "Proline", A = "Proline", G = "Proline" },
        A = { U = "Histidine", C = "Histidine", A = "Glutamine", G = "Glutamine" },
        G = { U = "Arginine", C = "Arginine", A = "Arginine", G = "Arginine" },
    },
    A = {
        U = { U = "Isoleucine", C = "Isoleucine", A = "Isoleucine", G = "Methionine" },
        C = { U = "Threonine", C = "Threonine", A = "Threonine", G = "Threonine" },
        A = { U = "Asparagine", C = "Asparagine", A = "Lysine", G = "Lysine" },
        G = { U = "Serine", C = "Serine", A = "Arginine", G = "Arginine" },
    },
    G = {
        U = { U = "Valine", C = "Valine", A = "Valine", G = "Valine" },
        C = { U = "Alanine", C = "Alanine", A = "Alanine", G = "Alanine" },
        A = { U = "Aspartic Acid", C = "Aspartic Acid", A = "Glutamic Acid", G = "Glutamic Acid" },
        G = { U = "Glycine", C = "Glycine", A = "Glycine", G = "Glycine" },
    },
}

local function translate_codon(codon)
    local result = codons
    for nucleotide in codon:gmatch('.') do
        if not valid_nucleotides[nucleotide] then
            error('Invalid nucleotide ' .. nucleotide)
        end

        result = result[nucleotide]
        if type(result) == 'string' then return result end
    end
end

local function translate_rna_strand(strand)
    local result = {}
    for codon in strand:gmatch('...') do
        local Prolinetein = translate_codon(codon)
        if Prolinetein == "STOP" then
            break
        end
        table.insert(result, Prolinetein)
    end
    return result
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
