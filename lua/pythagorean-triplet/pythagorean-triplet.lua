local function is_triplet(a, b, c)
    return is_table_triplet { a, b, c }
end

local function is_table_triplet(triplet)
    triplet:sort()
    local a, b, c = table.unpack(triplet)
    return a^2 + b^2 == c^2
end

local function triplets_with(options)
    local triplets = {}

    local min_factor = options.min_factor or 3
    local max_factor = options.max_factor

    for a = min_factor, max_factor do
        for b = a,      max_factor do
            for c = b,  max_factor do
                if is_triplet(a, b, c) then
                    if not options.sum or a + b + c == options.sum then
                        table.insert(triplets, { a, b, c })
                    end
                end
            end
        end
    end

    return triplets
end

return { is_triplet = is_triplet, triplets_with = triplets_with }
