return {
    kind = function(a, b, c)
        local sides = {a, b, c}
        table.sort(sides)
        a, b, c = table.unpack(sides)

        assert(a + b > c, 'Input Error')

        -- a <= b <= c
        if a == c then
            return 'equilateral'
        elseif a == b or b == c then
            return 'isosceles'
        else
            return 'scalene'
        end
    end
}
