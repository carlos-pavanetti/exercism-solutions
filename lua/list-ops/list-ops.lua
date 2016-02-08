local map = function(list, operation)
    local mapped_list = {}
    for k, v in ipairs(list) do
        mapped_list[k] = operation(v)
    end
    return mapped_list
end

local reduce = function(list, acc_const, operation)
    local acc = acc_const
    for _, v in ipairs(list) do
        acc = operation(v, acc)
    end
    return acc
end

local filter = function(list, predicate)
    local filtered_list = {}
    for _, v in ipairs(list) do
        if predicate(v) then
            table.insert(filtered_list, v)
        end
    end

    return filtered_list
end

local string_to_list = function(str)
    local list = {}
    str:gsub(".", function(char) table.insert(list, char) end)
    return list
end

return {
    map = map,
    reduce = reduce,
    filter = filter,
    string_to_list = string_to_list
}
