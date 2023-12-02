local numbers = 0
local patterns = {
    { index = "o", word = "one", total_char = 3, to_num = "1" },
    { index = "t", word = "two", total_char = 3, to_num = "2" },
    { index = "t", word = "three", total_char = 5, to_num = "3" },
    { index = "f", word = "four", total_char = 4, to_num = "4" },
    { index = "f", word = "five", total_char = 4, to_num = "5" },
    { index = "s", word = "six", total_char = 3, to_num = "6" },
    { index = "s", word = "seven", total_char = 5, to_num = "7" },
    { index = "e", word = "eight", total_char = 5, to_num = "8" },
    { index = "n", word = "nine", total_char = 4, to_num = "9" },
    { index = "%d", word = "%d", total_char = 1, to_num = "%d" },
}

function getFirstDigit(str)
    local c = str
    while true do
        for _, item in ipairs(patterns) do
            local sub = string.sub(c, 1, item.total_char)
            if sub == item.word then
                return item.to_num
            end
            if tonumber(sub) ~= nil and item.total_char == 1 then
                return sub
            end
        end
        c = string.sub(c, 2, string.len(c))
    end
end

function getLastDigitFromString(str)
    local to_return = nil
    local c = str
    while true do
        if string.len(c) == 0 then
            return to_return
        end

        for _, item in ipairs(patterns) do
            local sub = string.sub(c, 1, item.total_char)
            if sub == item.word then
                to_return = item.to_num
                break
            end
            if tonumber(sub) ~= nil then
                to_return = sub
                break
            end
        end
        c = string.sub(c, 2, string.len(c))
    end
end

while true do
    local line = io.read("L")
    if line == nil then
        break
    end

    local first_number = getFirstDigit(line)
    local last_number = getLastDigitFromString(line)

    numbers = numbers + tonumber(first_number .. last_number)
end

print(numbers)
