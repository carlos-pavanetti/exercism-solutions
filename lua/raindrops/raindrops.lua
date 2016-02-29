return function(number)
    local drops_result = {}
    if number % 3 == 0 then
        table.insert(drops_result, 'Pling')
    end
    if number % 5 == 0 then
        table.insert(drops_result, 'Plang')
    end
    if number % 7 == 0 then
        table.insert(drops_result, 'Plong')
    end

    if #drops_result > 0 then
        return table.concat(drops_result)
    end

    return tostring(number)
end
