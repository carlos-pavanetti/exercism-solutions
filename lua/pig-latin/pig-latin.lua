function string:begin_with_any_of(patterns)
    for _, pattern in ipairs(patterns) do
        if self:find('^' .. pattern) then
            return true
        end
    end
end

function string:reverse_split_at(pos)
    return self:sub(pos + 1) .. self:sub(1, pos)
end

local vowel_patterns = { '[aeiou]', 'yt', 'xr' }
local consonant_patterns = {
    { size = 3, '[^aeiou]qu', 'thr', 'sch' },
    { size = 2, 'qu', 'ch', 'th' },
    { size = 1, '[^aeiou]' }
}

local function process_word(word)
    if word:begin_with_any_of(vowel_patterns) then
        return word .. 'ay'
    else
        for _, patterns in ipairs(consonant_patterns) do
            if word:begin_with_any_of(patterns) then
                return word:reverse_split_at(patterns.size) .. 'ay'
            end
        end
    end
end

return function(phrase)
    return phrase:gsub('%a+', process_word)
end
