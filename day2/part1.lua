local games = 0

local limit = {
    red = 12,
    green = 13,
    blue = 14,
}

local get_current_game_number = function(str)
    return tonumber(string.match(str, "%d+"))
end

local is_game_valid = function(str)
    local game = string.match(str, "Game %d+: (.*)")
    local counter = {
        red = 0,
        green = 0,
        blue = 0,
    }
    for bundle in string.gmatch(game, "[^;]+") do
        counter = {
            red = 0,
            green = 0,
            blue = 0,
        }
        for item in string.gmatch(bundle:gsub("%s+", ""), "[^,]+") do
            if not item then
                break
            end

            local color = string.match(item, "%D+")
            local num = string.match(item, "%d+")
            counter[color] = counter[color] + tonumber(num)
        end
        if
            limit.blue < counter.blue
            or limit.green < counter.green
            or limit.red < counter.red
        then
            return false
        end
    end
    return true
end

while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    local game_number = get_current_game_number(line)
    if is_game_valid(line) then
        games = games + game_number
    end
end

print(games)
