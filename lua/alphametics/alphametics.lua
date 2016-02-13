local function is_word(token) return token:match('^%a+$') end
local function is_number(token) return token:match('^%d+$') end

local function parse_expression(source)
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
    local function clear_stack()
        while not stack_is_empty() do
            table.insert(current_hand_queue, stack_last_item())
            table.remove(symbol_stack)
        end
    end

    local function can_push_token_to_stack(token)
        return stack_is_empty()
        or precedence(stack_last_item()) < precedence(token)
    end

    for token in source:upper():gmatch('%S+') do
        if is_word(token) or is_number(token) then
            table.insert(current_hand_queue, token)
        elseif token:match('%p+') then
            if token == '==' then
                if current_hand_queue == right_hand_queue then
                    error 'Only one equality (==) is allowed per expression!'
                end
                clear_stack()
                current_hand_queue = right_hand_queue
            elseif can_push_token_to_stack(token) then
                table.insert(symbol_stack, token)
            else -- precedence is less than or equal
                repeat
                    table.insert(current_hand_queue, stack_last_item())
                    table.remove(symbol_stack)
                until can_push_token_to_stack(token)

                table.insert(symbol_stack, token)
            end
        end
    end

    clear_stack()
    return { left = left_hand_queue, right = right_hand_queue}
end

local function mount_letter_map(expression_queue)
    local letter_map = {}

    local function add_letters(hand)
        for _, token in ipairs(hand) do
            if is_word(token) then
                for letter in token:gmatch('.') do
                    letter_map[letter] = 9
                end
            end
        end
    end

    add_letters(expression_queue.left)
    add_letters(expression_queue.right)
    return letter_map
end

local function evaluate(expression_queue, letter_map)
    local function word_value(word)
        local value = 0
        for char in word:gmatch('.') do
            value = value * 10 + letter_map[char]
        end
        return value
    end

    local eval_queue = { left = {}, right = {} }
    local function get_operands(hand)
        local op2 = tonumber(eval_queue[hand][#eval_queue[hand]])
        table.remove(eval_queue[hand])
        local op1 = tonumber(eval_queue[hand][#eval_queue[hand]])
        table.remove(eval_queue[hand])
        return op1, op2
    end

    local function eval_hand(hand)
        for _, token in ipairs(expression_queue[hand]) do
            if is_word(token) then
                table.insert(eval_queue[hand], word_value(token))
            elseif token == '+' then
                local op1, op2 = get_operands(hand)
                table.insert(eval_queue[hand], op1 + op2)
            elseif token == '-' then
                local op1, op2 = get_operands(hand)
                table.insert(eval_queue[hand], op1 - op2)
            elseif token == '*' then
                local op1, op2 = get_operands(hand)
                table.insert(eval_queue[hand], op1 * op2)
            elseif token == '^' then
                local op1, op2
                 = get_operands(hand)
                table.insert(eval_queue[hand], op1 ^ op2)
            else
                table.insert(eval_queue[hand], token)
            end
        end
    end

    eval_hand 'left'
    eval_hand 'right'
    return { left = eval_queue.left[1], right = eval_queue.right[1] }
end

return { parse_expression, mount_letter_map, evaluate }
