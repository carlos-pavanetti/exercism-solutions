var transcribes = function(nucleotide) {
    var nucleotide_map = { 'A': 'U', 'T': 'A', 'G': 'C', 'C': 'G' };
    return nucleotide_map[nucleotide];
}

var DnaTranscriber = function() {}

DnaTranscriber.prototype.toRna = function(dnaStrand) {
    return dnaStrand.split("").map(transcribes).join("");
}

module.exports = DnaTranscriber;
