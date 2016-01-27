local anagram = {}
local anagram_mt = {__index = anagram}

anagram.new = function(_, test)
    local self = {}
    self.test = anagram.sort(test)

    return setmetatable(self, anagram_mt)
end

local table_insert = table.insert
local table_concat = table.concat
anagram.sort = function(str)
    local tab = {}
    str = str:lower()
    str:gsub(".", function(char) table_insert(tab, char) end)
    table.sort(tab)
    return table_concat(tab)
end

anagram.match = function(self, candidates)
    local selecteds = {}
    for _, candidate in ipairs(candidates) do
        if anagram.sort(candidate) == self.test then
            table_insert(selecteds, candidate)
        end
    end
    return selecteds
end

return anagram
