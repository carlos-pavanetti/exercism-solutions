local transform = function(old_set)
    local new_set = {}

    for score, letters in pairs(old_set) do
        for _, letter in ipairs(letters) do
            new_set[letter:lower()] = score
        end
    end

    return new_set
end

return {transform = transform}
