return function(sentence)
    local acronym_letters = {}
    for word in sentence:gmatch('%S[^%s%u]+') do
        table.insert(acronym_letters, word:sub(1, 1):upper())
    end

    return table.concat(acronym_letters)
end
