local square_of_sums = function(n)
    local sum = 0  -- Always be local :D
    for i=1, n do
        sum = sum + i
    end
    return sum^2
end

local sum_of_squares = function(n)
    local sum = 0
    for i=1, n do
        sum = sum + i^2
    end
    return sum
end

local diffsq = function(n)
    return square_of_sums(n) - sum_of_squares(n)
end

return {
    square_of_sums = square_of_sums,
    sum_of_squares = sum_of_squares,
    difference_of_squares = diffsq
}
