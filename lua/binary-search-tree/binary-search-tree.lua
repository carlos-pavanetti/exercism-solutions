local binary_search_tree    = {}
local binary_search_tree_mt = { __index = binary_search_tree }

binary_search_tree.new = function(_, value)
    local self = { left = nil, value = value, right = nil }
    return setmetatable(self, binary_search_tree_mt)
end

binary_search_tree.insert = function(self, value)
    if self == nil then
        return binary_search_tree:new(value)
    elseif value <= self.value then
        self.left = self.insert(self.left, value)
    elseif value > self.value then
        self.right = self.insert(self.right, value)
    end

    return self
end

binary_search_tree.from_list = function(_, list)
    assert(#list > 0)
    local bst
    for _, value in ipairs(list) do
        if not bst then
            bst = binary_search_tree:new(value)
        else
            bst:insert(value)
        end
    end

    return bst
end

binary_search_tree.values = function(self)
    return coroutine.wrap(function()
        if not self then return end
        if self.left then
            for value in self.left:values() do
                coroutine.yield(value)
            end
        end

        coroutine.yield(self.value)
        if self.right then
            for value in self.right:values() do
                coroutine.yield(value)
            end
        end
    end)
end

return binary_search_tree
