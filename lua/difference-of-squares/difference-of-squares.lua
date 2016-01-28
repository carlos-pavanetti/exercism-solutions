require 'fun'()

local square_of_sums = function(n)
    return reduce(operator.add, 0, range(n))^2
end

local sum_of_squares = function(n)
    return reduce(operator.add, 0, map(function(x) return x^2 end, range(n)))
end

local diffsq = function(n)
    return square_of_sums(n) - sum_of_squares(n)
end

return {
    square_of_sums = square_of_sums,
    sum_of_squares = sum_of_squares,
    difference_of_squares = diffsq
}
