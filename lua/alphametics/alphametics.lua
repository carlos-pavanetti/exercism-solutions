local function mount_expression(source)
    local  left_hand_queue = {}
    local right_hand_queue = {}

    local symbol_stack = {}

    local function stack_is_empty() return #symbol_stack == 0 end
    local function stack_last_item() return symbol_stack[#symbol_stack] end

    local precedence_map = { ['+'] = 1, ['-'] = 1, ['*'] = 3, ['^'] = 6, ['=='] = 0 }
    local function precedence(symbol)
        return precedence_map[symbol] or error 'Invalid symbol ' .. symbol
    end

    local current_hand_queue = left_hand_queue
    for token in source:upper():gmatch('%S+') do
        if token:match('^%w+$') then
            table.insert(current_hand_queue, token)
        elseif token:match('%p+') then
            if token == '==' then
                while not stack_is_empty() do
                    table.insert(current_hand_queue, stack_last_item())
                    table.remove(symbol_stack)
                end

                current_hand_queue = right_hand_queue
            elseif stack_is_empty()
            or precedence(stack_last_item()) < precedence(token) then
                table.insert(symbol_stack, token)
            else -- precedence is less than or equal
                repeat
                    table.insert(current_hand_queue, stack_last_item())
                    table.remove(symbol_stack)
                until stack_is_empty()
                or precedence(stack_last_item()) < precedence(token)

                table.insert(symbol_stack, token)
            end
        end
    end

    while not stack_is_empty() do
        table.insert(current_hand_queue, stack_last_item())
        table.remove(symbol_stack)
    end

    return { left = left_hand_queue, right = right_hand_queue}
end

return mount_expression
