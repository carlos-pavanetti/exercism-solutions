local set    = {}
local set_mt = {}

set_mt.__index = set
set_mt.__eq = set.equals

set.union = function(self, other)
    local items = {}

    for keys in self:items() do
        items[key] = true
    end
    for key in other:items() do
        items[key] = true
    end

    return set.new(unpack(items))
end

set.difference = function(self, other)
    local items = {}

    for keys in self:items() do
        items[key] = (not other.__items[key]) and true or false
    end

    return set.new(unpack(items))
end

set.symetric_difference = function(self, other)
    local items = {}

    for key in self:items() do
        items[key] = true
    end

    for key in other:items() do
        items[key] = (not self.__items[key]) and true or nil
    end

    return set.new(unpack(items))
end

set.intersection = function(self, other)
    local items = {}

    for key in self:items() do
        if other[key] then
            items[key] = true
        end
    end

    return set.new(unpack(items))
end

set.empty = function(self)
    return next(self.__items) == nil
end

set.equals = function(self, other)
    return self:symetric_difference(other):empty()
end

set.items = function(self)
    return pairs(self.__items)
end


set.new = function(...)
    local arg = {...}
    local self = { __items = {} }
    for _, value in ipairs(arg) do
        self.__items[value] = true
    end

    return setmetatable(self, set_mt)
end

return set.new
