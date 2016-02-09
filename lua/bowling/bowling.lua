local function sum(list)
    local acc = 0
    for _, value in ipairs(list) do
        acc = acc + value
    end
    return acc
end

return function()
    local frames = {}
    local current_frame = {}

    local function is_afoot()
        return #frames < 10
    end

    local function is_complete()
        return not is_afoot()
    end

    local function is_strike()
        return current_frame[1] == 10
    end

    local function is_spare()
        return current_frame[1] + current_frame[2] == 10
    end

    local function is_normal_frame()
        return not (is_spare() or is_strike())
    end

    local bowling_scorer = {}
    function bowling_scorer.roll(pins)
        assert(is_afoot(), 'Cannot roll once more, game is already over.')
        assert(pins >= 0 and pins <= 10,
              'Dropped pins should be between [0-10].')

        table.insert(current_frame, pins)
        if #current_frame > 2 then
            table.insert(frames, sum(current_frame))

            if is_strike() then
                current_frame = { current_frame[2], current_frame[3] }
            elseif is_spare() then
                current_frame = { current_frame[3] }
            end
        end

        if is_afoot() and #current_frame == 2 and is_normal_frame() then
            table.insert(frames, sum(current_frame))
            current_frame = {}
        end
    end

    function bowling_scorer.score()
        assert(is_complete(), 'Cannot retrieve score, game is not yet over.')

        local score = 0
        for _, frame_score in ipairs(frames) do
            score = score + frame_score
        end
        return score
    end

    return bowling_scorer
end
