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
            item[key] = true
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

set.empty = function(self)
    return next(self.__items) == nil
end

set.equals = function(self, other)
    return self:symmetric_difference(other):empty()
end
set_mt.__eq = set.equals

set.items = function(self)
    return pairs(self.__items)
end

set.add = function(self, key)
    self.__items[key] = true
end

return set.new
