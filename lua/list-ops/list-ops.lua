local null_function = function() error 'Not yet implemented' end

local map = function(list, operation)
    local mapped_list = {}
    for k, v in ipairs(list) do
        mapped_list[k] = operation(v)
    end
    return mapped_list
end

return {
    map = map,
    reduce = null_function,
    filter = null_function
}
