local set    = {}
local set_mt = { __index = set }

set.new = function(...)
    local arg = {...}
    local self = { __items = {} }
    for _, value in ipairs(arg) do
        self.__items[value] = true
    end

    return setmetatable(self, set_mt)
end

set.union = function(self, other)
    local items = {}

    for key in self:items() do
        items[key] = true
    end
    for key in other:items() do
        items[key] = true
    end

    return setmetatable({ __items = items }, set_mt)
end

set.difference = function(self, other)
    local items = {}

    for key in self:items() do
        if not other.__items[key] then
            items[key] = true
        end
    end

    return setmetatable({ __items = items }, set_mt)
end

set.symmetric_difference = function(self, other)
    local items = {}

    for key in self:items() do
        items[key] = true
    end

    for key in other:items() do
        items[key] = (not self.__items[key]) and true or nil
    end

    return setmetatable({ __items = items }, set_mt)
end

set.intersection = function(self, other)
    local items = {}

    for key in self:items() do
        if other.__items[key] then
            items[key] = true
        end
    end

    return setmetatable({ __items = items }, set_mt)
end

set.is_empty = function(self)
    return next(self.__items) == nil
end

set.equals = function(self, other)
    return self:symmetric_difference(other):is_empty()
end
set_mt.__eq = set.equals

set.is_disjoint = function(self, other)
    return self:intersection(other):is_empty()
end

set.is_subset = function(self, other)
    return self:intersection(other) == self
end

set.items = function(self)
    return pairs(self.__items)
end

set.size = function(self)
    return 0
end

set.add = function(self, key)
    self.__items[key] = true
end

set.remove = function(self, key)
    self.__items[key] = nil
end

set.contains = function(self, key)
    return self.__items[key] == true -- to force nil to false!
end

return set.new
