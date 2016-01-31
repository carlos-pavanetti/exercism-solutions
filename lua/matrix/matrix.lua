local tinsert, tonumber = table.insert, tonumber

local matrix_new = function (matrix_string)
    local matrix = {}

    for line in matrix_string:gmatch('[^\n\r]+') do
        local row = {}

        for number in line:gmatch('%d+') do
            tinsert(row, tonumber(number))
        end

        tinsert(matrix, row)
    end

    return {
        row = function(row)
            return matrix[row]
        end,

        column = function(column)
            local col = {}
            for _, row in ipairs(matrix) do
                tinsert(col, row[column])
            end

            return col
        end
    }
end

return matrix_new
