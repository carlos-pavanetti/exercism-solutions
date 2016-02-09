local function sum(list)
    local acc = 0
    for _, value in ipairs(list) do
        acc = acc + value
    end
    return acc
end

local function is_strike(frame)
    return frame and frame[1] == 10
end

local function is_spare(frame)
    return frame and (frame[1] or 0 + frame[2] or 0) == 10
end


return function()
    -- local score = 0
    local frames = {}

    local last_frame = {}
    local first_roll_in_frame = true

    -- local function sum_last_frame()
    --     return (last_frame[1] or 0) + (last_frame[2] or 0)
    -- end

    local bowling_scorer = {}
    function bowling_scorer.roll(pins)
        if #frames >= 10 then
            if not (is_spare(frames[#frames]) or is_strike(frames[#frames])) then
                error ''
            end
        end
        assert(pins >=  0, 'Dropped pins should be a non-negative number')
        assert(pins <= 10, 'Roll cannot be better than a strike')

        table.insert(last_frame, pins)
        if not first_roll_in_frame or pins == 10 then
            table.insert(frames, last_frame)

            first_roll_in_frame = true
            last_frame = {}
        else
            first_roll_in_frame = false
        end
    end

    function bowling_scorer.score()
        assert(#frames >= 10, 'Cannot retrieve score at game beginning')
        assert(first_roll_in_frame, '')

        local frame_score = {}
        for frame_index=#frames, 1, -1 do
            local frame = frames[frame_index]

            if is_strike(frame) and frame_index < 10 then
                frame_score[frame_index] = 10 + frame_score[frame_index + 1]
            elseif is_spare(frame) and frame_index < 10 then
                frame_score[frame_index] = 10 + frames[frame_index + 1][1]
            else
                frame_score[frame_index] = frame[1] + (frame[2] or 0)
            end
        end
        return sum(frame_score)
    end

    return bowling_scorer
end
