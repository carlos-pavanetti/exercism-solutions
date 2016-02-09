return function(options)
    if options.span == 0 then return 1 end
    assert(options.span > 0, 'span should not be negative')
    assert(#options.digits > 0, 'string should be not null')
    assert(#options.digits >= options.span,
           'span should be not bigger than string')

    local largest_product = -math.huge
    local step = options.span - 1

    for i = 1, #options.digits - step do
        local product = 1
        for digit in options.digits:sub(i, i + step):gmatch('.') do
            product = product * digit
        end
        largest_product = math.max(largest_product, product)
    end

    return largest_product
end
