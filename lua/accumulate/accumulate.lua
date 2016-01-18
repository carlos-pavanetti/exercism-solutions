local accumulate = function(table, transform)
    local transformed = {}
    for index,item in ipairs(table) do
        transformed[index] = transform(item)
    end

    return transformed
end

return accumulate
