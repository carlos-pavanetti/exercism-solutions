local valid_nucleotides = { U = true, C = true, A = true, G = true }

local codons = {
    U = {
        U = { U = "Phenylalanine", C = "Phenylalanine", A = "Leucine", G = "Leucine" },
        C = { U = "Serine", C = "Serine", A = "Serine", G = "Serine" },
        A = { U = "Tyrosine", C = "Tyrosine", A = "STOP", G = "STOP" },
        G = { U = "Cysteine", C = "Cysteine", A = "STOP", G = "Tryptophan" },
    },
    C = {
        U = { U = "leu", C = "leu", A = "leu", G = "leu" },
        C = { U = "pro", C = "pro", A = "pro", G = "pro" },
        A = { U = "his", C = "his", A = "gln", G = "gln" },
        G = { U = "arg", C = "arg", A = "arg", G = "arg" },
    },
    A = {
        U = { U = "ile", C = "ile", A = "ile", G = "Methionine" },
        C = { U = "thr", C = "thr", A = "thr", G = "thr" },
        A = { U = "asn", C = "asn", A = "lys", G = "lys" },
        G = { U = "ser", C = "ser", A = "arg", G = "arg" },
    },
    G = {
        U = { U = "val", C = "val", A = "val", G = "val" },
        C = { U = "ala", C = "ala", A = "ala", G = "ala" },
        A = { U = "asp", C = "asp", A = "glu", G = "glu" },
        G = { U = "gly", C = "gly", A = "gly", G = "gly" },
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
        local protein = translate_codon(codon)
        if protein == "STOP" then
            break
        end
        table.insert(result, protein)
    end
    return result
end

return { codon = translate_codon, rna_strand = translate_rna_strand }
