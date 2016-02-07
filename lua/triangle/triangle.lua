return {
    kind = function(a, b, c)
        assert((a + b + c) > 2 * math.max(a, b, c), 'Input Error')

        if a == b then
            if b == c then
                return 'equilateral'
            else
                return 'isosceles'
            end
        elseif a == c or b == c then
            return 'isosceles'
        else
            return 'scalene'
        end
    end
}
