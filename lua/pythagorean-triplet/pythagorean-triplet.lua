local function is_table_triplet(triplet)
    table.sort(triplet)
    local a, b, c = table.unpack(triplet)
    return a^2 + b^2 == c^2
end

local function is_triplet(a, b, c)
    return is_table_triplet { a, b, c }
end

local function gcd(a, b)
    if a > b then a, b = b, a end
    if a == 0 then return b end
    return gcd(a, b - a)
end

local function triplets_with(options)
    local triplets = {}

    local min_factor = options.min_factor or 3
    local max_factor = options.max_factor

    local function is_in_constraints(abc)
        local sum_abc = abc[1] + abc[2] + abc[3]
        return abc[1] >= min_factor and abc[2] >= min_factor
        and (not options.sum or options.sum == sum_abc)
    end

    local m, n = 2, 1
    local a, b, c

    c = 0 -- a number to compare with max_factor
    while c <= max_factor do
        while n < m do
            a = m^2 - n^2
            b = 2 * m * n
            c = m^2 + n^2
            if c > max_factor then break end

            for k = 1, max_factor/c do
                local abc = { k*a, k*b, k*c }
                if is_in_constraints(abc) then
                    table.sort(abc)
                    table.insert(triplets, abc)
                end
            end
            repeat
                n = n + 2 -- only same parity numbers
            until gcd(m, n) == 1 -- m & n must be coprimes
        end

        m = m + 1
        n = m % 2 + 1 -- m & n must have distinct parity
    end

    return triplets
end

return { is_triplet = is_triplet, triplets_with = triplets_with }
