local null_function = function() error 'Not yet implemented' end

local map = function(list, operation)
    local mapped_list = {}
    for k, v in ipairs(list) do
        mapped_list[k] = operation(v)
    end
    return mapped_list
end

local reduce = function(list, acc, operation)
    for _, v in ipairs(list) do
        acc = operation(v, acc)
    end
    return acc
end

return {
    map = map,
    reduce = reduce,
    filter = null_function
}
