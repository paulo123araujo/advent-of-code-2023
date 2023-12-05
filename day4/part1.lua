local get_current_game_points = function(input)
    local left_pipe, right_pipe = string.match(input, "Card%s+%d+: (.+) | (.+)")

    local left = {}
    for num in string.gmatch(left_pipe, "(%d+)()") do
        table.insert(left, num)
    end

    local right = {}
    for num in string.gmatch(right_pipe, "(%d+)()") do
        table.insert(right, num)
    end

    local count = 0
    for _, l in ipairs(left) do
        for _, r in ipairs(right) do
            if l == r then
                if count == 0 then
                    count = 1
                else
                    count = count * 2
                end
                break
            end
        end
    end

    return count
end

local total = 0

while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    local game_points = get_current_game_points(line)
    total = total + game_points
end

print(total)
