local function is_triplet(a, b, c)
    local hypotenuse = math.max(a, b, c)
    local cathetusA = math.min(a, b, c)
    local cathetusB = a + b + c - (cathetusA + hypotenuse)
    return (hypotenuse^2) == (cathetusA^2 + cathetusB^2)
end

local function triplets_with(lower, upper)

end

return { is_triplet = is_triplet, triplets_with = triplets_with }
