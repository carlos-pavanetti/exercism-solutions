local isDivisibleBy = function(dividend, divisor)
    return dividend % divisor == 0
end

return function(year)
    if isDivisibleBy(year, 100) then
        return isDivisibleBy(year, 400)
    end
    return isDivisibleBy(year, 4)
end
