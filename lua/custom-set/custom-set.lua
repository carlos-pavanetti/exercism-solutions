local set    = {}
local set_mt = { __index = set }

set.new = function(...)
    local self = { _items = {}, _size = 0 }

    for _, value in ipairs({...}) do
        if not self._items[value] then
            self._items[value] = true
            self._size = self._size + 1
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
    return self._size == 0
end

set.equals = function(self, other)
    return self:is_subset(other) and other:is_subset(self)
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
    return pairs(self._items)
end

set.size = function(self)
    return self._size
end

set.add = function(self, key)
    if not self:contains(key) then
        self._items[key] = true
        self._size = self._size + 1
    end
end

set.remove = function(self, key)
    if self:contains(key) then
        self._items[key] = nil
        self._size = self._size + 1
    end
end

set.contains = function(self, key)
    return self._items[key] == true -- to force nil to false!
end

return set.new
