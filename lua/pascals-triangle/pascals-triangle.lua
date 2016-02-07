return function(row_number)
    local rows = {{1}}
    for i=2, row_number do
        rows[i] = {1}
        for j=1, #rows[i-1] do
            rows[i][j+1] = rows[i-1][j] + (rows[i-1][j+1] or 0)
        end
    end

    return {
        rows = rows,
        last_row = rows[#rows]
    }
end
