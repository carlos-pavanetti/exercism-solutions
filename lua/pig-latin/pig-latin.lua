local vowels = { a = true, e = true, i = true, o = true, u = true, yt = true, xr = true }
local specials_consonants = { ch = true, qu = true, th = true, thr = true, sch = true}

local function process_word(word)
    local first_letter, tail = word:match('(.)(.+)')
    local two_first_letters, rest_two = word:match('(..)(.+)')
    local three_first_letters, rest_three = word:match('(...)(.+)')
    if vowels[first_letter] or vowels[two_first_letters] then
        return word .. 'ay'
    elseif specials_consonants[three_first_letters] then
        return (rest_three or '') .. three_first_letters .. 'ay'
    elseif specials_consonants[two_first_letters] then
        return (rest_two or '') .. two_first_letters .. 'ay'
    elseif tail:match('^qu') then
        return tail:sub(3) .. first_letter .. 'quay'
    else
        return tail .. first_letter .. 'ay'
    end
end

return function(phrase)
    return phrase:gsub('%a+', process_word)
end
