local calculate_total = function(mapp)
    local nums = {}
    local symbols = {}
    for row = 1, #mapp, 1 do
        for num, pos in string.gmatch(mapp[row], "(%d+)()") do
            table.insert(nums, {
                value = tonumber(num),
                row = row,
                pos_ini = pos - #num,
                pos_end = pos - 1,
            })
        end

        for symbol, pos in string.gmatch(mapp[row], "([^%d.\n])()") do
            table.insert(symbols, {
                value = symbol,
                row = row,
                pos_ini = pos - 1,
                pos_end = pos - 1,
            })
        end
    end

    local is_adjacent = function(num, symbol)
        if symbol.row < num.row - 1 or symbol.row > num.row + 1 then
            return false
        end

        return symbol.pos_ini >= num.pos_ini - 1
            and symbol.pos_end <= num.pos_end + 1
    end

    local total = 0
    for _, num in ipairs(nums) do
        for _, symbol in ipairs(symbols) do
            if is_adjacent(num, symbol) then
                total = total + num.value
                break
            end
        end
    end

    return total
end

local mapp = {}
while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    table.insert(mapp, line)
end

print(calculate_total(mapp))
