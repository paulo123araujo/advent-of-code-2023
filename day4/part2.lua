local total = function(lines)
    local winners = {}
    local cards = {}

    for _, line in ipairs(lines) do
        local left_pipe, right_pipe =
            string.match(line, "Card%s+%d+: (.+) | (.+)")

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
                    count = count + 1
                end
            end
        end

        table.insert(winners, count)
    end

    for _ in ipairs(winners) do
        table.insert(cards, 1)
    end

    for i, card in ipairs(cards) do
        for j = 1, winners[i], 1 do
            if cards[i + j] then
                cards[i + j] = cards[i + j] + card
            end
        end
    end

    local total = 0
    for _, value in ipairs(cards) do
        total = total + value
    end

    return total
end

local lines = {}

while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    table.insert(lines, line)
end

print(total(lines))
