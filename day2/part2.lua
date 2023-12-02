local total = 0

local minimun_values = function(str)
    local game = string.match(str, "Game %d+: (.*)")
    local counter = {
        red = 0,
        green = 0,
        blue = 0,
    }
    for bundle in string.gmatch(game, "[^;]+") do
        for item in string.gmatch(bundle:gsub("%s+", ""), "[^,]+") do
            if not item then
                break
            end

            local color = string.match(item, "%D+")
            local num = tonumber(string.match(item, "%d+"))

            if counter[color] < num then
                counter[color] = num
            end
        end
    end

    return counter.green * counter.red * counter.blue
end

while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    total = total + minimun_values(line)
end

print(total)
