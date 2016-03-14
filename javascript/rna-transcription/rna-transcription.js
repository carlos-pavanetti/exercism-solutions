var transcribes = function(nucleotide) {
    if (nucleotide == 'A')
        return 'U';
    if (nucleotide == 'T')
        return 'A';
    if (nucleotide == 'G')
        return 'C';
    if (nucleotide == 'C')
        return 'G';
}

var DnaTranscriber = function() {}

DnaTranscriber.prototype.toRna = function(dnaStrand) {
    return dnaStrand.split("").map(transcribes).join("");
}

module.exports = DnaTranscriber;
