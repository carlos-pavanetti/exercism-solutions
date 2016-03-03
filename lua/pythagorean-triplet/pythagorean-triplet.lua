local function is_triplet(a, b, c)
    local hypotenuse = math.max(a, b, c)
    local cathetusA = math.min(a, b, c)
    local cathetusB = a + b + c - (cathetusA + hypotenuse)
    return (hypotenuse^2) == (cathetusA^2 + cathetusB^2)
end

local function triplets_with(options)
    local triplets = {}

    local min_factor = options.min_factor or 1
    local max_factor = options.max_factor
    local sum        = options.sum
    for a = min_factor, max_factor do
        for b = a,      max_factor do
            for c = b,  max_factor do
                if is_triplet(a, b, c) then
                    if not sum or a + b + c == sum then
                        table.insert(triplets, { a, b, c })
                    end
                end
            end
        end
    end

    return triplets
end

return { is_triplet = is_triplet, triplets_with = triplets_with }
