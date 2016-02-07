local set    = {}
local set_mt = { __index = set }

set.new = function(...)
    local self = { __items = {}, __size = 0 }

    for _, value in ipairs({...}) do
        if not self.__items[value] then
            self.__items[value] = true
            self.__size = self.__size + 1
        end
    end

    return setmetatable(self, set_mt)
end

set.union = function(self, other)
    local union = set.new()

    for key in self:items() do
        union:add(key)
    end
    for key in other:items() do
        union:add(key)
    end

    return union
end

set.difference = function(self, other)
    local diff = set.new()

    for key in self:items() do
        if not other:contains(key) then
            diff:add(key)
        end
    end

    return diff
end

set.symmetric_difference = function(self, other)
    local sym_diff = set.new()

    for key in self:items() do
        if not other:contains(key) then
            sym_diff:add(key)
        end
    end

    for key in other:items() do
        if not self:contains(key) then
            sym_diff:add(key)
        end
    end

    return sym_diff
end

set.intersection = function(self, other)
    local intersection = set.new()

    for key in self:items() do
        if other:contains(key) then
            intersection:add(key)
        end
    end

    return intersection
end

set.is_empty = function(self)
    return next(self.__items) == nil
end

set.equals = function(self, other)
    for key in self:items() do
        if not other:contains(key) then
            return false
        end
    end

    for key in other:items() do
        if not self:contains(key) then
            return false
        end
    end
    return true
end
set_mt.__eq = set.equals

set.is_disjoint = function(self, other)
    for key in self:items() do
        if other:contains(key) then
            return false
        end
    end

    for key in other:items() do
        if self:contains(key) then
            return false
        end
    end
    return true
end

set.is_subset = function(self, other)
    for key in self:items() do
        if not other:contains(key) then
            return false
        end
    end

    return true
end

set.items = function(self)
    return pairs(self.__items)
end

set.size = function(self)
    return self.__size
end

set.add = function(self, key)
    if not self:contains(key) then
        self.__items[key] = true
        self.__size = self.__size + 1
    end
end

set.remove = function(self, key)
    if self:contains(key) then
        self.__items[key] = nil
        self.__size = self.__size + 1
    end
end

set.contains = function(self, key)
    return self.__items[key] == true -- to force nil to false!
end

return set.new
