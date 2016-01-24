local anagram = {}
local anagram_mt = {__index = anagram}

anagram.new = function(_, test)
    local self = {}
    self.test = anagram.sort(test)

    return setmetatable(self, anagram_mt)
end

local table_insert = table.insert
local table_compare
table_icompare = function(table1, table2)
    if #table1 ~= #table2 then
        return false
    end
    for k = 1, #table1 do
        if table1[k] ~= table2[k] then
            return false
        end
    end
    return true
end

anagram.match = function(self, candidates)
    local selecteds = {}
    for _, candidate in ipairs(candidates) do
        if table_icompare(anagram.sort(candidate), self.test) then
            table_insert(selecteds, candidate)
        end
    end
    return selecteds
end

anagram.sort = function(str)
    local tab = {}
    str = str:lower()
    str:gsub(".", function(char) table_insert(tab, char) end)
    table.sort(tab)
    return tab
end

return anagram
