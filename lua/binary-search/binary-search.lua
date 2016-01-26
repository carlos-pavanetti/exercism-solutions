local ceil = math.ceil

return function (array, key)
    local length = #array
    local index = ceil (length / 2)
    while array[index] ~= key do
        if index <= 1 or index >= length then
            return -1
        elseif array[index] > key then
            index = ceil (index / 2)
        else
            index = ceil ((length + index) / 2)
        end
    end
    return index
end
